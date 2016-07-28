str = "my love lcx"
def str.myupcase
  self.gsub(/lcx/,"Lcx")
end

p str.myupcase  #=> "my love Lcx"
p str.methods(false)  #=> [:myupcase]

#===========================two methods to get singleton class===============================>

singleton_class = str.singleton_class
p singleton_class  #=> #<Class:#<String:0x00000000ad7bb8>>
p singleton_class.instance_methods.grep(/my/)  #=> [:myupcase]
p str.singleton_class.superclass  #=> String

p class << str     # get obj's singleton class
  self             # at here , I can define singleton method for str(an object)
end                #=> #<Class:#<String:0x00000000ad7bb8>>

p class << String  # class is also a object , so class has a singleton class
  self             # at here , I can define class method for String(a class) , actually , class method is also singleton method
end                #=> #<Class:String>



