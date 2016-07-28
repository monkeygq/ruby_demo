class Myclass
  @@var = 1
  def get_class_var
    @@var 
  end
end

class Mysubclass < Myclass
  def change_class_var
    @@var += 1
  end
end


o = Myclass.new
p o.get_class_var  #=> 1

sub_o = Mysubclass.new
sub_o.change_class_var

p o.get_class_var  #=> 2
