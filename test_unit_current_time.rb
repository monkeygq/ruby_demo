class Loan
  def initialize(book)
    @book = book
    @time = Loan.time.now
  end
  def self.time
    @current_time || Time  # return a class
  end
  def to_s
    "#{@book.upcase} loaned on #{@time}"
  end
end

#=========================== start test program ==========================>

# make a fake time for test , use class instance variable , instance_eval

class Faketime
  def self.now
    "2016-08-09"
  end
end

require "test/unit"

class TestLoan < Test::Unit::TestCase
  def test_to_string
    Loan.instance_eval { @current_time = Faketime }
    o = Loan.new(:rubycookbook)
    assert_equal "RUBYCOOKBOOK loaned on 2016-08-09", o.to_s
  end
end
