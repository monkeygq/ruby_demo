require 'test/unit'
module Kernel
  def with(para)
    begin
      yield
    ensure # no matter whether there are exceptions , below will be executed.
      para.dispose
    end
  end
end

class Mytest
  def dispose
    @myvar = true
  end
  def disposed?
    @myvar
  end
end

class TestMytest < Test::Unit::TestCase
  def test_with
    mytest = Mytest.new
    with(mytest) {}
    assert mytest.disposed?
  end
  def test_with_exception
    mytest = Mytest.new
    begin
      with(mytest) { raise Exception }
    rescue Exception => e
      assert mytest.disposed?
    end
  end
  def test_with_exception_2nd
    mytest = Mytest.new
    # assert_raises(expected exception type){block}
    # execute block , if an exception occurs and the exception is expected exception type,
    # pass the assert 
    assert_raises(Exception) {
      with(mytest) { 
        raise Exception }
    }
    assert mytest.disposed?
  end
end

=begin

Run options: 

# Running tests:

...

Finished tests in 0.000785s, 3822.5959 tests/s, 5096.7945 assertions/s.

3 tests, 4 assertions, 0 failures, 0 errors, 0 skips

=end
