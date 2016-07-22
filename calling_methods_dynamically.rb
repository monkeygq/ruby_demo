class Myclass
  def mymethod(para)
    p para
  end
end

Myclass.new.send(:mymethod, "233")  #=> "233"  # :mymethod is a Symbol

# Symbol test
p :abc.class    #=> Symbol
p :abc.to_s     #=> "abc"
p "abc".to_sym  #=> :abc
sym = :abc
p "head_#{sym}_tail"  #=> "head_abc_tail"
# end

#================================================================================>
class Mydata
  def initialize
  end
  def get_cpu_info(id)
    "#{id}.00 Ghz"
  end
  def get_cpu_price(id)
    id * 60
  end
  def get_mouse_info(id)
    "wireless mouse"
  end
  def get_mouse_price(id)
    id * 10
  end
  def get_keyboard_info(id)
    "razer keyboard"
  end
  def get_keyboard_price(id)
    id * 30
  end
end

class Computer
  def initialize(id, data)
    @id = id
    @data = data
  end
  def cpu
    sameway :cpu
  end
  def mouse
    sameway :mouse
  end
  def keyboard
    sameway :keyboard
  end
  def sameway(name)
    info = @data.send "get_#{name}_info", @id
    price = @data.send "get_#{name}_price", @id
    result = "#{name}_info=#{info} & #{name}_price=#{price}RMB"
    result = "*#{result}" if price > 100
    return result
  end
end

pc = Computer.new(2, Mydata.new)
p pc.cpu       #=> "*cpu_info=2.00 Ghz & cpu_price=120RMB" 
p pc.mouse     #=> "mouse_info=wireless mouse & mouse_price=20RMB"
p pc.keyboard  #=> "keyboard_info=razer keyboard & keyboard_price=60RMB"
#=================================================================================>

# below is a better class Computer , named Computer2
class Computer2
  def initialize(id, data)
    @id = id
    @data = data
  end
  def self.my_define_method(name)
    define_method(name) do
      info = @data.send "get_#{name}_info", @id
      price = @data.send "get_#{name}_price", @id
      result = "#{name}_info=#{info} & #{name}_price=#{price}RMB"
      result = "*#{result}" if price > 100
      return result
    end    
  end
  my_define_method :cpu
  my_define_method :mouse
  my_define_method :keyboard 
end

pc2 = Computer2.new(2, Mydata.new)
p pc2.cpu       #=> "*cpu_info=2.00 Ghz & cpu_price=120RMB" 
p pc2.mouse     #=> "mouse_info=wireless mouse & mouse_price=20RMB"
p pc2.keyboard  #=> "keyboard_info=razer keyboard & keyboard_price=60RMB"
#=================================================================================>

# below is the best class Computer , named Computer3
class Computer3
  def initialize(id, data)
    @id = id
    @data = data
    data.methods.grep(/^get_(.*)_info$/){Computer3.my_define_method $1}
  end
  def self.my_define_method(name)
    define_method(name) do
      info = @data.send "get_#{name}_info", @id
      price = @data.send "get_#{name}_price", @id
      result = "#{name}_info=#{info} & #{name}_price=#{price}RMB"
      result = "*#{result}" if price > 100
      return result
    end    
  end
end


pc3 = Computer2.new(2, Mydata.new)
p pc3.cpu       #=> "*cpu_info=2.00 Ghz & cpu_price=120RMB" 
p pc3.mouse     #=> "mouse_info=wireless mouse & mouse_price=20RMB"
p pc3.keyboard  #=> "keyboard_info=razer keyboard & keyboard_price=60RMB"


















