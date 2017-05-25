class Base
  @sub = []

  class << self
    attr_accessor :sub
    def inherited(subclass)
      sub << subclass
    end

    def method_added(method)
      p "#{method} is joined"
    end

    def const_missing(const)
      "#{const} is missing"
    end

  end

  def test
    "I am test"
  end

  at_exit { p "bye Base" }
  at_exit { p "233" } # output first, last in/first out
end

class A < Base
  @sub = []
end

class B < Base
end

class C < A
end

p Base.sub
p A.sub
p Base::Test
#=>
#"test is joined"
#[A, B]
#[C]
#"Test is missing"
#"233"
#"bye Base"
