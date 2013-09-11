module Dsl
  class Spec
    def initialize(cls, mname)
      @class = cls
      @mname = mname

      unless cls.method_defined? mname
        raise "Method #{mname} not defined for #{cls}"
      end
    end

    def include_spec(blk, *args)
      instance_exec(*args, &blk)
    end

    # Takes a block that transforms the incoming arguments
    # into (possibly) new arguments to be fed to the method.
    def pre(&b)
      mname = @mname
      old_mname = "__dsl_old_#{mname}_#{gensym}"
      pre_name = define_method_gensym("pre", &b)

      @class.class_eval do
        alias_method old_mname, mname

        define_method mname do |*args, &blk|
          results = send pre_name, *args, &blk
          new_args = results[:args]
          new_blk = results[:block]
          send old_mname, *new_args, &new_blk
        end
      end
    end

    # Takes a block that transforms the return value
    # into a (possibly) return value to be returned from the method.
    # The block also gets handed the original arguments.
    def post(&b)
      mname = @mname
      old_mname = "__dsl_old_#{mname}_#{gensym}"
      post_name = define_method_gensym("post", &b)

      @class.class_eval do
        alias_method old_mname, mname

        define_method mname do |*args, &blk|
          res = send old_mname, *args, &blk
          send post_name, res, *args, &blk
        end
      end
    end

    # pre/post_task are versions of pre/post that ignore the
    # return value from the block and just pass along the
    # original arguments or return value.

    def pre_task(&b)
      pre_task_name = define_method_gensym("pre_task", &b)

      mname = @mname

      pre do |*args, &blk|
        send pre_task_name, *args, &blk
        { args: args, block: blk }
      end
    end

    def post_task(&b)
      post_task_name = define_method_gensym("post_task", &b)

      post do |r, *args, &blk|
        send post_task_name, r, *args, &blk
        r
      end
    end

    class PreConditionFailure < Exception; end
    class PostConditionFailure < Exception; end

    # pre/post_cond are like pre/post_task, except they check
    # the block return and error if the block returns false/nil.

    def pre_cond(desc = "", &b)
      pre_cond_name = define_method_gensym("pre_cond", &b)

      pre_task do |*args, &blk|
        raise PreConditionFailure, desc unless send pre_cond_name, *args, &blk
      end
    end

    def post_cond(desc = "", &b)
      post_cond_name = define_method_gensym("post_cond", &b)

      post_task do |r, *args, &blk|
        raise PostConditionFailure, desc unless send post_cond_name, r, *args, &blk
      end
    end


    # Since we're describing an existing method, not creating a new DSL,
    # here we want the dsl keyword to just intercept the block and add
    # our checks. We'll overwrite this functionality inside the entry version.
    def dsl(&b)
      pre do |*args, &blk|
        # Allow for methods that only sometimes take DSL blocks.
        if blk
          new_blk = Proc.new do |*args|
            ec = singleton_class
            ec.extend Dsl
            ec.class_eval &b
            instance_exec(*args, &blk)
          end
          { args: args, block: new_blk }
        else { args: args, block: blk }
        end
      end
    end

    private

    def define_method_gensym(desc="blk",&blk)
      blk_name = "__dsl_#{desc}_#{gensym}"

      @class.class_eval do
        define_method blk_name, &blk
      end

      blk_name
    end

    def gensym
      if @gensym
        gsym = @gensym
      else
        gsym = 0
      end
      @gensym = gsym + 1
      gsym
    end
  end

  class Keyword < Spec
    def initialize(cls, mname)
      if cls.method_defined? mname
        raise "Method #{mname} already defined for #{cls}"
      end

      @class = cls
      @mname = mname

      action { nil }
    end

    # For non-DSL keywords
    def action(&blk)
      mname = @mname

      @class.class_eval do
        define_method mname, &blk
      end
    end

    # For keywords that take the same DSL they are in.
    def dsl_rec
      action do |*args, &blk|
        instance_exec(*args, &blk)
      end
    end

    # For keywords that take a different DSL than they are in.
    def dsl(cls = nil, *a, &b)
      mname = @mname

      raise "Need a class or block" unless cls or b

      unless b.nil?
        cls = Class.new(Object) if cls.nil?
        Lang.new(cls).instance_exec(*a, &b)
      end

      action do |*args, &blk|
        cls.new(*a).instance_exec(*args, &blk)
      end
    end
  end

  class Lang
    def initialize(cls)
      @class = cls
    end

    def keyword(mname, *args, &blk)
      Keyword.new(@class, mname).instance_exec(*args, &blk)
    end

    def spec(mname, *args, &blk)
      Spec.new(@class, mname).instance_exec(*args, &blk)
    end
  end

  def entry(mname,*args, &blk)
    Lang.new(self).keyword(mname, &blk)
  end

  def spec(mname, *args, &blk)
    Lang.new(self).spec(mname, &blk)
  end

  def self.create_spec(&b)
    Proc.new &b
  end
end
