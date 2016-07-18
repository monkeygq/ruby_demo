# top level context : main
p self	#=> main
@flag1 = self
p self.class	#=> Object

def mymethod	
	p self	#=> main
	@flag2 = self
	p @flag1 == @flag2	#=> true
end

mymethod

puts "#===================================================>"

class Myclass
	p self	#=> Myclass
	def instance_method
		p self	#=> #<Myclass:0x00000001df3f30> : an instance
	end
	def self.class_method
		p self	#=> Myclass
	end
end

Myclass.new.instance_method
Myclass.class_method

puts "#===================================================>"

class Person
	attr_accessor :name
	def set_name(para)
	  @name = para
		#self.name = para	# @name is same to self.name
	end
end

body = Person.new
p body.name	#=> nil
body.set_name("monkeygq")
p body.name	#=> monkeygq

puts "#===================================================>"








