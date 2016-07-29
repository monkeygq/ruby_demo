class String
  alias_method :mylength, :length  # new_name, old_name
  def length  # repacking length method , invoke original length method (alias : mylength)
    mylength > 5 ? "long" : "short"
  end
end

p "my love lcx".mylength  #=> 11      # length method's alias
p "my love lcx".length    #=> "long"  

#===================================================================================================>

# in ruby2.0 , prepend is more convenient 

=begin

module Mymodule
    def length
        super > 5 ? "long" : "short"
    end
end

String.class_eval { prepend Mymodule }

p String.ancestors      #=> [Mymodule, String, Comparable, Object, Kernel, BasicObject]
p "my love lcx".length  #=> "long"

=end
