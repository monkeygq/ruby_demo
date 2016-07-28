#==================== class extension ====================>
module Mymodule
  def mymethod
    "233"
  end
end

class Myclass
  class << self  # Myclass's singleton class's scope
    include Mymodule
  end
end
p Myclass.mymethod  #=> "233"
p Myclass.methods(false)

#=================== object extension ====================>

o = Object.new
class << o
  include Mymodule
end
p o.mymethod        #=> "233"
