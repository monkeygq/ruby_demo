class Myclass
  @var = 1  # self is Myclass
  @class_instance_var = :hello
  # an advanced read/write method
  class << self
    attr_accessor :class_instance_var  # self is Myclass
  end
  def self.read
    @var
  end
  def write
    @var = 2
  end
  def read
    @var  # self is Myclass's instance object
  end
end

obj = Myclass.new
p obj.read     #=> nil
obj.write   
p obj.read     #=> 2
p Myclass.read #=> 1

p Myclass.class_instance_var #=> :hello
Myclass.class_instance_var = :world
p Myclass.class_instance_var #=> :world
