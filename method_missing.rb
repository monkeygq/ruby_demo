# carry on calling_methods_dynamically.rb
# aboves is define_method
# below is method_missing
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

class Computer4
  def initialize(id, data)
    @id = id
    @data = data
  end
  def method_missing(name)
    super unless @data.respond_to? "get_#{name}_info"
    info = @data.send "get_#{name}_info", @id
    price = @data.send "get_#{name}_price", @id
    result = "#{name}_info=#{info} & #{name}_price=#{price}RMB"
    result = "*#{result}" if price > 100
    return result
  end
  # after override method_missing , you must override respond_to_missing?
  # respond_to_missing? method : if it is a ghost method , return ture
  # then , if it is a ghost method , respond_to? return ture , too. 
  def respond_to_missing?(method, include_private = false)
    @data.respond_to? "get_#{method}_info" || super
  end
  # override respond_to_missing? is better
  #def respond_to?(method)
  #  @data.respond_to? "get_#{method}_info" || super
  #end
end

pc4 = Computer4.new(2, Mydata.new)
p pc4.cpu       #=> "*cpu_info=2.00 Ghz & cpu_price=120RMB" 
p pc4.mouse     #=> "mouse_info=wireless mouse & mouse_price=20RMB"
p pc4.keyboard  #=> "keyboard_info=razer keyboard & keyboard_price=60RMB"
p pc4.respond_to? :cpu  #=> ture
p pc4.respond_to_missing? :cpu, include_private = false  #=> ture
