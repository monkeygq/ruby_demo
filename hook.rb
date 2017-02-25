class String
  def self.inherited(subclass)
    puts "String was inherited by #{subclass}"
  end
end

module M1
  def self.included(para)
    puts "M1 is included by #{para}"
  end
end

module M2
  def self.prepended(para)
    puts "M2 is prepended by #{para}"
  end
end

class Myclass < String
  include M1
  prepend M2
end
p Myclass.ancestors
#=> M1 is included by Myclass
#=> M2 is prepended by Myclass
#=> [M2, Myclass, M1, String, Comparable, Object, Kernel, BasicObject]

