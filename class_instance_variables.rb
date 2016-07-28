class Myclass
  @var = 1  # self is Myclass
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
