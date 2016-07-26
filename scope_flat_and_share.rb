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

mymethod #=># this is a must
p counter  #=> 0
p inc 4    #=> 4
p counter  #=> 4
p mytest   #=> -1

#==========================================================================>

# ruby : shared scope 2nd , I think below is more useful

class Myclass2
  def mymethod
    shared = 0
    Myclass2.send :define_method, :test1 do # define_method : is a class method ( Module's private method ) , so use send method invoke it
      shared += 1
    end
    Myclass2.send :define_method, :test2 do # define_method : define a method for a class or a module
      shared += 1
    end
  end
  def mytest
    shared = -1
  end
end
myinstance = Myclass2.new
myinstance.mymethod
p myinstance.test1   #=> 1
p myinstance.test2   #=> 2
p myinstance.mytest  #=> -1
p myinstance.test1   #=> 3
p myinstance.test2   #=> 4













