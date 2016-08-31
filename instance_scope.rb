module AttrLazy
  def attr_lazy(name, &block)
    name_var = '@' + name.to_s.delete('?') # delete '?'
    define_method(name) do
      # three method about instance variable , remember them.
      instance_variable_defined?(name_var) ? instance_variable_get(name_var) : instance_variable_set(name_var, instance_eval(&block))
    end
  end
end

class Numbers
  extend AttrLazy  # add class method : attr_lazy for Numbers 
  
  def initialize(*numbers)
    @numbers = numbers
  end
  #==========================================================================================================>
  #attr_lazy(name, &block)
  #define a new method , named by name argument.
  #if the instance doesn't have the instance variable , execute the block to assign to the instance variable.
  #if the instance variable is exist , return the instance variable and the block can't be executed.
  #==========================================================================================================> 
  attr_lazy :evens do
    @numbers.select(&:even?)  
  end
  
  attr_lazy :even? do
    @numbers.all?(&:even?)
  end
  
  def mark_even
    @even = [1, 3, 5]
  end
end

example = Numbers.new(1, 2)
p example.evens  #=> [2]
p example.even?  #=> false


example = Numbers.new(1)
example.mark_even
p example.even?  #=> [1, 3, 5]
