class Myclass
  def initialize(var)
    @var = var
  end
  def get_var
    @var
  end
end

myinstance = Myclass.new(1)
method_obj = myinstance.method :get_var  # invoke Kernel#method to get method object
p method_obj.call  # invoke Method#call to use method object , scope : self object

myinstance2 = Myclass.new(2)
method_obj = myinstance2.method :get_var
p method_obj.call
