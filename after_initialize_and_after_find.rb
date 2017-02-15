require 'active_record'
ActiveRecord::Base.establish_connection(adapter: :mysql2, host: :localhost, database: :hycloud_portal)

class Vm < ActiveRecord::Base
  after_initialize { p "You have initialized an object!" }
  after_find { p "You have found an object!"}
end

Vm.first # invoke sequence : after_find > after_initialize

#=>
#"You have found an object!"
#"You have initialized an object!"


