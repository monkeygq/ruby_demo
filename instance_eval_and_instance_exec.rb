class Myclass
  def initialize
    @var = 1
  end
end

o = Myclass.new
o.instance_eval do
  p self  # self is receiver
  p "@var=#{@var}"  #=> "@var=1"
  var = 2
  @var = var
  p "@var=#{@var}"  #=> "@var=2"
end

o.instance_eval do
  p "@var=#{@var} , @var2=#{@var2}"  #=> "@var=2 , @var2="
end

#==========================================================>

o.instance_exec (var2=3) { p "@var=#{@var} , var2=#{var2}" }  #=> "@var=2 , var2=3"

















