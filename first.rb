require 'test/unit'
class Array
  def first(*num)
    if !block_given? || num.length > 1
      super
    else
      self.select { |item| yield item }.instance_eval("super")
    end
  end
end


class Qwer < Test::Unit::TestCase
  def test_first
    assert_equal(1, [1,2,3,4,5].first)
    assert_equal(2, [1,2,3,4,5].first { |i| i >= 2 })
    assert_equal(nil, [1,2,3,4,5].first { |i| i >= 6 })
    assert_equal([], [1,2,3,4,5].first(0))
    assert_equal([], [1,2,3,4,5].first(0) { |i| i >= 2 })
    assert_equal([1,2], [1,2,3,4,5].first(2))
    assert_equal([2,3], [1,2,3,4,5].first(2) { |i| i >= 2 })
    assert_equal([1,2,3,4,5], [1,2,3,4,5].first(8))
    assert_equal([2,3,4,5], [1,2,3,4,5].first(8) { |i| i >= 2 })
  end
end
