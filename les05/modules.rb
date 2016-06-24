module M
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
    base.class_variable_set(:@@c, 0)
  end
  
  module ClassMethods
    def c
      class_variable_get(:@@c)
    end
  end

  module InstanceMethods
    def inc
      self.class.class_variable_set(:@@c, self.class.class_variable_get(:@@c) + 1)
    end
  end
end

class A
  include M
end

class B
  include M
end

