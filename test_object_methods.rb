class Myclass
  def my_method
    @v = 1
  end
end

my_instance = Myclass.new
p my_instance.instance_variables	#=> []
my_instance.my_method	#init @v
p my_instance.instance_variables	#=> [:@v]
p my_instance.methods.grep(/my/)	#=> [:my_method]
p Myclass.instance_methods	  #instance methods
p Myclass.methods	#class methods
p my_instance.class	#=> Myclass
p Myclass.class	        #=> Class
p Array.class		#=> Class		
p Class.instance_methods(false)		#=> [:allocate, :new, :superclass]	#false : ignore extention 
p Object.superclass	#=> BasicObject
p Class.superclass	#=> Module
