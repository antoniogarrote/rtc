module Kernel
  def qualified_const_get(str)
    path = str.to_s.split('::')
    from_root = path[0].empty?
    if from_root
      from_root = []
      path = path[1..-1]
    else
      start_ns = ((Class === self)||(Module === self)) ? self : self.class
      from_root = start_ns.to_s.split('::')
    end
    until from_root.empty?
      begin
        return (from_root+path).inject(Object) { |ns,name| ns.const_get(name) }
      rescue NameError
        from_root.delete_at(-1)
      end
    end
    path.inject(Object) { |ns,name| ns.const_get(name) }
  end
end

module RoutingHelper
  def self.get_class(name)
    qualified_const_get name
  end

  def self.class_exists?(name)
    c = get_class name
    c.is_a? Class
  rescue NameError
    false
  end

  def self.use_namespace(ns, name)
    unless not ns or ns.empty?
      ns.join("::") << "::" << name
    else
      name
    end
  end

  def self.extend_namespace(ns, name)
    if ns
      ns.push(name)
    else
      [name]
    end
  end

  def self.retract_namespace(ns, name)
    raise Exception, "Expected namespace, got #{ns}" unless ns
    last = ns.pop
    # For some reason this check seems to be failing comparing equal symbols
    # on the talks routing table?!
#    raise Exception, "Last item #{last} didn't match #{name}" unless ns == name
    ns
  end
end

class ActionDispatch::Routing::RouteSet
  extend Dsl

  logging_spec = Dsl.create_spec do |name|
    pre_task do
      p "Entering #{name} on #{self}"
    end
    
    post_task do
      p "Exiting #{name} on #{self}"
    end
  end
  
  spec :draw do
    include_spec logging_spec, "draw"
    dsl do
      spec :get do
        include_spec logging_spec, "get"
      end
      spec :post do
        include_spec logging_spec, "post"
      end
      spec :namespace do
        pre_task do |name|
          @dsl_namespace = RoutingHelper.extend_namespace(@dsl_namespace,name)
        end
        post_task do |ret, name|
          @dsl_namespace = RoutingHelper.retract_namespace(@dsl_namespace,name)
        end
      end
      spec :resources do
        pre_cond do |*args|
          args.all? do |a|
            if a.is_a? String or a.is_a? Symbol
            then 
              cname = RoutingHelper.use_namespace @dsl_namespace, "#{a.capitalize}Controller"
              p "Checking for class #{cname}"
              RoutingHelper.class_exists? cname
            else true
            end
          end
        end
        # post_cond do |ret, *args|
        #   args.all? do |a|
        #     if a.is_a? String or a.is_a? Symbol
        #     then 
        #       # how to get the Application?
        #       app.method_defined? "#{a.downcase}_path"
        #     else true
        #     end
        #   end
        # end
        include_spec logging_spec, "resources"
      end
      spec :resource do
        # pre_cond do |*args|
        #   args.all? do |a|
        #     if a.is_a? String or a.is_a? Symbol
        #     then 
        #       cname = "#{a.capitalize}sController"
        #       p "Checking for class #{cname}"
        #       RoutingHelper.class_exists? cname
        #     else true
        #     end
        #   end
        # end
        include_spec logging_spec, "resource"
      end
      spec :collection do
        include_spec logging_spec, "collection"
      end
      spec :member do
        include_spec logging_spec, "member"
      end
    end
  end
end
