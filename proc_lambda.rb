#define proc
def mymethod(&p)
  p
end
p = mymethod { |x,y| x+y }

#invoke proc
p p.call(2,3)  #=> 5
p p[2,3]       #=> 5
p p.(2,3)      #=> 5
#========================================>
p = Proc.new { |x,y| x+y }
p p.call(2,3)  #=> 5
#========================================>

#define lambda
l = lambda {|x| x+1 }

#invoke lambda 
p l.call(2)    #=> 3
p l[2]         #=> 3
p l.(2)        #=> 3
#========================================>
l = ->(x) { x+1 }
p l.call(2)    #=> 3
#========================================>
l = ->(x,factor=2) { x*factor }  # default argument
p l.call(2)    #=> 4
#========================================>
def compose(f,g)
  ->(x) { f.call(g.call(x)) }
end
l = compose(->x{x+1},->x{x*x})   # lambda argument
p l.call(4)    #=> 17
#========================================>
def multiply(data,n)
  data.collect{ |x| x*n }
end
p multiply([1,2,3],2)     #=> [2,4,6]
#========================================>
def multiplier(n)
  ->(data){ data.collect{ |x| x*n} }
end
l = multiplier(2)
p l.([1,2,3])             #=> [2,4,6]
