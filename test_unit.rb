require "test/unit"
class Myclass
  def initialize(a, b)
    @a = a
    @b = b
  end 
  def mymethod
    c, d = @a.divmod @b
    c
  end
end

class TestMyclass < Test::Unit::TestCase
  def test_mymethod # method name must begin with test
    assert_equal(3, Myclass.new(100, 30).mymethod)
    assert_equal(4, Myclass.new(100, 30).mymethod)
  end
end
=begin

Run options: 

# Running tests:

F

Finished tests in 0.000743s, 1346.7052 tests/s, 2693.4104 assertions/s.

  1) Failure:
test_mymethod(TestMyclass) [test_unit.rb:16]:
<4> expected but was
<3>.

1 tests, 2 assertions, 1 failures, 0 errors, 0 skips

=end

