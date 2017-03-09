class C                                                                         
  class << self
    def test1
      1   
    end 
  end 

  self.instance_eval do
    def test2
      2   
    end 
  end 
  self.class_eval do
    def test3
      3   
    end 
  end 
end

p C.test1  #=> 1
p C.test2  #=> 2
p C.new.test3  #=> 3

