require 'active_support/concern'
module Myconcern
  extend ActiveSupport::Concern
  def an_instance_method
    "an_instance_method"
  end
  module ClassMethods # class methods write here!!!!
    def a_class_method
      "a_class_method"
    end
  end
end

class Myclass
  include Myconcern # get Myconcern's class methods and instance methods
end

p Myclass.new.an_instance_method  #=> "an_instance_method"
p Myclass.a_class_method  #=> "a_class_method"
p Myclass.ancestors  #=> [Myclass, Myconcern, Object, Kernel, BasicObject]

#======================================================================================>
# include chain : Mytest < Myc1 < Myc2
module Myc2
  extend ActiveSupport::Concern
  def m3
    p "Myc2 instance method"
  end 
  module ClassMethods
    def m4
      p "Myc2 class method"
    end 
  end 
end

module Myc1
  extend ActiveSupport::Concern
  include Myc2
  def m1
    p "Myc1 instance method"
  end 
  module ClassMethods
    def m2
      p "Myc1 class method"
    end 
  end 
end

class Mytest
  include Myc1
end


Mytest.m2 #=> "Myc1 class method"
Mytest.m4 #=> "Myc2 class method"
Mytest.new.m1 #=> "Myc1 instance method"
Mytest.new.m3 #=> "Myc2 instance method"
p Mytest.ancestors #=> [Mytest, Myc1, Myc2, Object, Kernel, BasicObject]


