class Couple
  def new_love(boy, girl)
    puts "#{boy} and #{girl} are a couple"
    if block_given?
      yield
    end
  end
  def self.change_method_name(new_name, old_name)
    #self is class
    define_method(old_name) do |*args, &block|  # receice all arguments and block
      puts "#{old_name}() is deprecated. Use #{new_name}()."
      send new_name, *args, &block  # in block , self is class instance object , pass all arguments and block by send method
    end
  end
  change_method_name :new_love, :old_love
end

Couple.new.old_love("hgq", "lcx") { puts "have a block" }

#=> old_love() is deprecated. Use new_love().
#=> hgq and lcx are a couple
#=> have a block

