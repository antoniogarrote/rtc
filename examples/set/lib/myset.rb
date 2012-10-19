#!/usr/bin/env ruby
#--
# set.rb - defines the MySet class
#++
# Copyright (c) 2002-2008 Akinori MUSHA <knu@iDaemons.org>
#
# Documentation by Akinori MUSHA and Gavin Sinclair.
#
# All rights reserved.  You can redistribute and/or modify it under the same
# terms as Ruby.
#
#   $Id: set.rb 34533 2012-02-10 08:28:48Z naruse $
#
# == Overview
#
# This library provides the MySet class, which deals with a collection
# of unordered values with no duplicates.  It is a hybrid of Array's
# intuitive inter-operation facilities and Hash's fast lookup.  If you
# need to keep values ordered, use the SortedMySet class.
#
# The method +to_set+ is added to Enumerable for convenience.
#
# See the MySet and SortedMySet documentation for examples of usage.


#
# MySet implements a collection of unordered values with no duplicates.
# This is a hybrid of Array's intuitive inter-operation facilities and
# Hash's fast lookup.
#
# The equality of each couple of elements is determined according to
# Object#eql? and Object#hash, since MySet uses Hash as storage.
#
# MySet is easy to use with Enumerable objects (implementing +each+).
# Most of the initializer methods and binary operators accept generic
# Enumerable objects besides sets and arrays.  An Enumerable object
# can be converted to MySet using the +to_set+ method.
#
# == Example
#
#   require 'set'
#   s1 = MySet.new [1, 2]                   # -> #<MySet: {1, 2}>
#   s2 = [1, 2].to_set                    # -> #<MySet: {1, 2}>
#   s1 == s2                              # -> true
#   s1.add("foo")                         # -> #<MySet: {1, 2, "foo"}>
#   s1.merge([2, 6])                      # -> #<MySet: {6, 1, 2, "foo"}>
#   s1.subset? s2                         # -> false
#   s2.subset? s1                         # -> true
#
# == Contact
#
#   - Akinori MUSHA <knu@iDaemons.org> (current maintainer)
#
require 'rtc_lib'

Rtc::MasterSwitch.turn_off

class MySet
  rtc_annotated [:a, :each]



  include Enumerable

  def get_parameters
    if @hash.keys
    then [@hash.keys[0]]
    else [nil]
    end
  end

  # Creates a new set containing the given objects.
  def self.[](*ary)
    new(ary)
  end

  # Creates a new set containing the elements of the given enumerable
  # object.
  #
  # If a block is given, the elements of enum are preprocessed by the
  # given block.
  def initialize(enum = nil, &block) # :yields: o
    @hash ||= Hash.new

    enum.nil? and return

    if block
      do_with_enum(enum) { |o| add(block[o]) }
    else
      merge(enum)
    end
  end

  def do_with_enum(enum, &block) # :nodoc:
    if enum.respond_to?(:each_entry)
      enum.each_entry(&block)
    elsif enum.respond_to?(:each)
      enum.each(&block)
    else
      raise ArgumentError, "value must be enumerable"
    end
  end
  private :do_with_enum

  # Copy internal hash.
  def initialize_copy(orig)
    @hash = orig.instance_eval{@hash}.dup
  end

  def freeze    # :nodoc:
    super
    @hash.freeze
    self
  end

  def taint     # :nodoc:
    super
    @hash.taint
    self
  end

  def untaint   # :nodoc:
    super
    @hash.untaint
    self
  end

  # Returns the number of elements.
  typesig("size: () -> Fixnum")
  def size
    @hash.size
  end
  alias length size

  # Returns true if the set contains no elements.
  typesig("'empty?': () -> %bool")
  def empty?
    @hash.empty?
  end

  # Removes all elements and returns self.
  typesig("clear: () -> MySet<a>")
  def clear
    @hash.clear
    self
  end

  # Replaces the contents of the set with the contents of the given
  # enumerable object and returns self.
  def replace(enum)
    if enum.instance_of?(self.class)
      @hash.replace(enum.instance_variable_get(:@hash))
    else
      clear
      merge(enum)
    end

    self
  end

  # Converts the set to an array.  The order of elements is uncertain.
  typesig("to_a: () -> Array<a>")
  def to_a
    @hash.keys
  end


  def flatten_merge(set, seen = MySet.new) # :nodoc:
    set.each { |e|
      if e.is_a?(MySet)
        if seen.include?(e_id = e.object_id)
          raise ArgumentError, "tried to flatten recursive MySet"
        end

        seen.add(e_id)
        flatten_merge(e, seen)
        seen.delete(e_id)
      else
        add(e)
      end
    }

    self
  end
  protected :flatten_merge

  # Returns a new set that is a copy of the set, flattening each
  # containing set recursively.
  def flatten
    self.class.new.flatten_merge(self)
  end

  # Equivalent to MySet#flatten, but replaces the receiver with the
  # result in place.  Returns nil if no modifications were made.
  def flatten!
    if detect { |e| e.is_a?(MySet) }
      replace(flatten())
    else
      nil
    end
  end

  # Returns true if the set contains the given object.
  typesig("'include?': (a) -> %bool")
  def include?(o)
    @hash.include?(o)
  end
  alias member? include?

  # Returns true if the set is a superset of the given set.
  typesig("'superset?'<u>: (MySet<u>) -> %bool")
  def superset?(set)
    set.is_a?(MySet) or raise ArgumentError, "value must be a set"
    return false if size < set.size
    set.all? { |o| include?(o) }
  end

  # Returns true if the set is a proper superset of the given set.
  typesig("'proper_superset?'<u>: (MySet<u>) -> %bool")
  def proper_superset?(set)
    set.is_a?(MySet) or raise ArgumentError, "value must be a set"
    return false if size <= set.size
    set.all? { |o| include?(o) }
  end

  # Returns true if the set is a subset of the given set.
  typesig("'subset?'<u>: (MySet<u>) -> %bool")
  def subset?(set)
    set.is_a?(MySet) or raise ArgumentError, "value must be a set"
    return false if set.size < size
    all? { |o| set.include?(o) }
  end

  # Returns true if the set is a proper subset of the given set.
  typesig("'proper_subset?'<u>: (MySet<u>) -> %bool")
  def proper_subset?(set)
    set.is_a?(MySet) or raise ArgumentError, "value must be a set"
    return false if set.size <= size
    all? { |o| set.include?(o) }
  end

  # Calls the given block once for each element in the set, passing
  # the element as parameter.  Returns an enumerator if no block is
  # given.
  typesig("each: () {(a) -> %any } -> MySet<a>")
  typesig("each: () -> Enumerator")
  def each
    block_given? or return enum_for(__method__)
    @hash.each_key { |o| yield(o) }
    self
  end

  # Adds the given object to the set and returns self.  Use +merge+ to
  # add many elements at once.
  typesig("add: (a) -> MySet<a>")
  def add(o)
    @hash[o] = true
    self
  end
  alias << add

  # Adds the given object to the set and returns self.  If the
  # object is already in the set, returns nil.
  typesig("'add?': (a) -> MySet<a>")
  def add?(o)
    if include?(o)
      nil
    else
      add(o)
    end
  end

  # Deletes the given object from the set and returns self.  Use +subtract+ to
  # delete many items at once.
  typesig("delete<u>: (u) -> MySet<a>")
  def delete(o)
    @hash.delete(o)
    self
  end

  # Deletes the given object from the set and returns self.  If the
  # object is not in the set, returns nil.
  typesig("'delete?'<u>: (u) -> MySet<a>")
  def delete?(o)
    if include?(o)
      delete(o)
    else
      nil
    end
  end

  # Deletes every element of the set for which block evaluates to
  # true, and returns self.
  typesig("delete_if: () {(a) -> %bool } -> MySet<a>")
  def delete_if
    block_given? or return enum_for(__method__)
    to_a.each { |o| @hash.delete(o) if yield(o) }
    self
  end

  # Deletes every element of the set for which block evaluates to
  # false, and returns self.
  typesig("keep_if: () {(a) -> %bool } -> MySet<a>")
  def keep_if
    block_given? or return enum_for(__method__)
    to_a.each { |o| @hash.delete(o) unless yield(o) }
    self
  end

  # Replaces the elements with ones returned by collect().
  def collect!
    block_given? or return enum_for(__method__)
    set = self.class.new
    each { |o| set << yield(o) }
    replace(set)
  end
  alias map! collect!

  # Equivalent to MySet#delete_if, but returns nil if no changes were
  # made.
  typesig("'reject!' : () {(a) -> %bool} -> MySet<a>")
  def reject!
    block_given? or return enum_for(__method__)
    n = size
    delete_if { |o| yield(o) }
    size == n ? nil : self
  end

  # Equivalent to MySet#keep_if, but returns nil if no changes were
  # made.
  typesig("'select!' : () {(a) -> %bool} -> MySet<a>")
  def select!
    block_given? or return enum_for(__method__)
    n = size
    keep_if { |o| yield(o) }
    size == n ? nil : self
  end

  # Merges the elements of the given enumerable object to the set and
  # returns self.
  def merge(enum)
    if enum.instance_of?(self.class)
      @hash.update(enum.instance_variable_get(:@hash))
    else
      do_with_enum(enum) { |o| add(o) }
    end

    self
  end

  # Deletes every element that appears in the given enumerable object
  # and returns self.
  def subtract(enum)
    do_with_enum(enum) { |o| delete(o) }
    self
  end

  # Returns a new set built by merging the set and the elements of the
  # given enumerable object.
  def |(enum)
    dup.merge(enum)
  end
  alias + |             ##
  alias union |         ##

  # Returns a new set built by duplicating the set, removing every
  # element that appears in the given enumerable object.
  def -(enum)
    dup.subtract(enum)
  end
  alias difference -    ##

  # Returns a new set containing elements common to the set and the
  # given enumerable object.
  def &(enum)
    n = self.class.new
    do_with_enum(enum) { |o| n.add(o) if include?(o) }
    n
  end
  alias intersection &  ##

  # Returns a new set containing elements exclusive between the set
  # and the given enumerable object.  (set ^ enum) is equivalent to
  # ((set | enum) - (set & enum)).
  def ^(enum)
    n = MySet.new(enum)
    each { |o| if n.include?(o) then n.delete(o) else n.add(o) end }
    n
  end

  # Returns true if two sets are equal.  The equality of each couple
  # of elements is defined according to Object#eql?.
  typesig("'==': (%any) -> %bool", {"unwrap" => [0]})
  def ==(other)
    if self.equal?(other)
      true
    elsif other.instance_of?(self.class)
      @hash == other.instance_variable_get(:@hash)
    elsif other.is_a?(MySet) && self.size == other.size
      other.all? { |o| @hash.include?(o) }
    else
      false
    end
  end

  def hash      # :nodoc:
    @hash.hash
  end

  def eql?(o)   # :nodoc:
    return false unless o.is_a?(MySet)
    @hash.eql?(o.instance_eval{@hash})
  end

  # Classifies the set by the return value of the given block and
  # returns a hash of {value => set of elements} pairs.  The block is
  # called once for each element of the set, passing the element as
  # parameter.
  #
  # e.g.:
  #
  #   require 'set'
  #   files = MySet.new(Dir.glob("*.rb"))
  #   hash = files.classify { |f| File.mtime(f).year }
  #   p hash    # => {2000=>#<MySet: {"a.rb", "b.rb"}>,
  #             #     2001=>#<MySet: {"c.rb", "d.rb", "e.rb"}>,
  #             #     2002=>#<MySet: {"f.rb"}>}
  typesig("classify<t>: () { (a) -> t } -> Hash<t,MySet<a>>")
  typesig("classify: () -> Enumerator")
  def classify # :yields: o
    block_given? or return enum_for(__method__)

    h = {}

    each { |i|
      x = yield(i)
      (h[x] ||= self.class.new).add(i)
    }

    h
  end

  # Divides the set into a set of subsets according to the commonality
  # defined by the given block.
  #
  # If the arity of the block is 2, elements o1 and o2 are in common
  # if block.call(o1, o2) is true.  Otherwise, elements o1 and o2 are
  # in common if block.call(o1) == block.call(o2).
  #
  # e.g.:
  #
  #   require 'set'
  #   numbers = MySet[1, 3, 4, 6, 9, 10, 11]
  #   set = numbers.divide { |i,j| (i - j).abs == 1 }
  #   p set     # => #<MySet: {#<MySet: {1}>,
  #             #            #<MySet: {11, 9, 10}>,
  #             #            #<MySet: {3, 4}>,
  #             #            #<MySet: {6}>}>
  def divide(&func)
    func or return enum_for(__method__)

    if func.arity == 2
      require 'tsort'

      class << dig = {}         # :nodoc:
        include TSort

        alias tsort_each_node each_key
        def tsort_each_child(node, &block)
          fetch(node).each(&block)
        end
      end

      each { |u|
        dig[u] = a = []
        each{ |v| func.call(u, v) and a << v }
      }

      set = MySet.new()
      dig.each_strongly_connected_component { |css|
        set.add(self.class.new(css))
      }
      set
    else
      MySet.new(classify(&func).values)
    end
  end

  InspectKey = :__inspect_key__         # :nodoc:

  # Returns a string containing a human-readable representation of the
  # set. ("#<MySet: {element1, element2, ...}>")
  typesig("inspect: () -> String")
  def inspect
    ids = (Thread.current[InspectKey] ||= [])

    if ids.include?(object_id)
      return sprintf('#<%s: {...}>', self.class.name)
    end

    begin
      ids << object_id
      return sprintf('#<%s: {%s}>', self.class, to_a.inspect[1..-2])
    ensure
      ids.pop
    end
  end

  def pretty_print(pp)  # :nodoc:
    pp.text sprintf('#<%s: {', self.class.name)
    pp.nest(1) {
      pp.seplist(self) { |o|
        pp.pp o
      }
    }
    pp.text "}>"
  end

  def pretty_print_cycle(pp)    # :nodoc:
    pp.text sprintf('#<%s: {%s}>', self.class.name, empty? ? '' : '...')
  end
end

module Enumerable
  # Makes a set from the enumerable object with given arguments.
  # Needs to +require "set"+ to use this method.
  def to_set(klass = MySet, *args, &block)
    klass.new(self, *args, &block)
  end
end

Rtc::MasterSwitch.turn_on