class Myclass
  def method_missing(method, *args)
    puts "you called undefined method : #{method}(#{args.join(',')})"
  end
end

Myclass.new.mymethod(2,3,4)  #=> you called undefined method : mymethod(2,3,4)
#==============================================================================>
# parameter and argument : *
def mytest(para1, *para2)
  puts "para1=#{para1}"
  para2.each {|i| puts "para2=#{i}"}
end
arr = ["yes", "no", "233"]

mytest(arr)   #=> para1=["yes", "no", "233"]

mytest(*arr)  #=> para1=yes
              #=> para2=no
              #=> para2=233
#==============================================================================>
# parameter and argument : &
def mytest2(a,b,&p)
  p.(a,b)
end

mytest2(2,3) { |x,y| puts x+y }  #=> 5

myproc = Proc.new{ |x,y| puts x+y }
mytest2(2,3,&myproc)  #=> 5
