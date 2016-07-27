class Myclass
  def mymethod
    "233"
  end
  def add_method_to(a_class)
    a_class.class_eval do
      def mymethod2
        "my love lcx"
      end
    end
  end
end

myinstance = Myclass.new
myinstance.add_method_to(Myclass)
p Myclass.instance_methods(false)  #=> [:mymethod, :add_method_to, :mymethod2]
p myinstance.mymethod2  #=> "my love lcx"
