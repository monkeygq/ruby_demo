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
  include Myconcern
end

p Myclass.new.an_instance_method  #=> "an_instance_method"
p Myclass.a_class_method  #=> "a_class_method"
