class Myclass
  Myconst = "Myclass::const"
  def self.myputs
    p "my love lcx by Myclass"
  end
end

Myclass.myputs		#=> "my love lcx by Myclass"
p Myclass::Myconst	#=> "Myclass::const"

puts "#=====================================================================>"

module Mymodule
  Myconst = "Mymodule::const"
  class Myclass
    Myconst = "Mymodule::Myclass::const"
    def mydir
      Module.nesting	# current path , nesting Array
    end
  end
  def self.myputs
    p "my love lcx by Mymodule"
  end
end

Mymodule.myputs		#=> "my love lcx by Mymodule"
p Mymodule::Myconst	#=> "Mymodule::const"
p Mymodule::Myclass::Myconst	#=> "Mymodule::Myclass::const"
p Mymodule.constants	#=> [:Myconst, :Myclass]

p Mymodule.const_get("Myclass").new.mydir	#=> [Mymodule::Myclass, Mymodule]
