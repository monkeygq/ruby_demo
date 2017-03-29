class Test
  def my_public
    p "I am public"
  end
  def my_protected
    p "I am protected"
  end
  def my_private
    p "I am private"
  end
  protected :my_protected
  private :my_private
  def my_test
    my_public
    my_protected
    my_private
  end
end

# =======================================================================================>
t = Test.new
t.my_test
#=>
#"I am public"
#"I am protected"
#"I am private"
#
# wrap up
# public, protected and private can be called by class which defined it
# protected and private must be called implicitly
# =======================================================================================>

t.my_public #=> "I am public"
begin
t.my_protected 
rescue Exception => e
  p e.message #=> "protected method `my_protected' called for #<Test:0x00000001d6fc30>"
end

begin
t.my_private 
rescue Exception => e
  p e.message #=> "private method `my_private' called for #<Test:0x0000000100bf58>" 
end


# wrap up
# protected and private cannot be called directly by instance object
# public can be called directly by instance object
# =======================================================================================>

t.send(:my_private) #=> "I am private"
t.send(:my_protected) #=> "I am protected"
# wrap up
# send method : a magic way that instance objects can call protected or private methods
# =======================================================================================>
class SubTest < Test
  def sub_my_test
    my_public
    my_protected
    my_private
  end
end

sub_t = SubTest.new
sub_t.sub_my_test
#=> 
#"I am public"
#"I am protected"
#"I am private"
#
# wrap up
# public, protected and private can be called by subclass of class which defined it
# protected and private must be called implicitly
# =======================================================================================>

class Test
  def call_my_protected(para)
    para.my_protected
  end
  def call_my_private(para)
    para.my_private
  end
end

t1 = Test.new
t2 = Test.new
t2.call_my_protected(t1) #=> "I am protected"
begin
t2.call_my_private(t1)
rescue Exception => e
  p e.message #=> "private method `my_private' called for #<Test:0x000000028acaa8>"
end

# wrap up
# protected can be accessed by other instance objects, private cannot!




