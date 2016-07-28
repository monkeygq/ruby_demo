#==================== class extension ====================>
# class entension for the class's singleton class , the class gets new class methods
module Mymodule
  def mymethod  # define instance method
    "233"
  end
end
p Mymodule.instance_methods(false)  #=> [:mymethod]

class Myclass
  class << self  # Myclass's singleton class's scope
    include Mymodule
  end
end
p Myclass.mymethod  #=> "233"


# class extension : advanced version
class Myclass2
  extend Mymodule
end
p Myclass.mymethod  #=> "233"

#=================== object extension ====================>
#object extension for the object's singleton class , the object gets new singleton methods
o = Object.new
class << o
  include Mymodule
end
p o.mymethod        #=> "233"

#object extension : advanced version
o2 = Object.new
o2.extend Mymodule
p o2.mymethod       #=> "233"
