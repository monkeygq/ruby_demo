# ruby : flat scope

myvar = "my love lcx"

=begin

class Myclass
  # I want print myvar here , but scope is different
  def mymethod
    # I want print myvar here , but scope is different either .
  end
end

let me overwrite below

=end

Myclass = Class.new do
  puts "in Myclass scope , myvar = #{myvar}"
  define_method :mymethod do
    puts "in mymethod scope , myvar = #{myvar}"
  end
end

Myclass.new.mymethod   #=> in Myclass scope , myvar = my love lcx
                       #=> in mymethod scope , myvar = my love lcx
                       # Myclass still is a class                   
#==========================================================================>

# ruby : shared scope

def mymethod
  shared = 0
  Kernel.send :define_method, :counter do
    shared
  end  
  Kernel.send :define_method, :inc do |x|
    shared += x
  end  
end

def mytest
  shared = -1
end

mymethod # this is a must
p counter  #=> 0
p inc 4    #=> 4
p counter  #=> 4
p mytest   #=> -1
















