require 'active_record'
ActiveRecord::Base.establish_connection(adapter: :mysql2, host: :localhost, database: :hycloud_portal)

class Application < ActiveRecord::Base
  has_many :vms
  after_touch { p "You have touched an application" }
end
class Vm < ActiveRecord::Base
  belongs_to :application, touch: true # If used along with belongs_to then touch will invoke touch method on associated object
  after_touch { p "You have touched a vm!"}
end
begin
  p "1+++++++++++++++++++++++++++++++++++"
  Vm.first.touch # updates updated_at/on with current time                          
  p "2+++++++++++++++++++++++++++++++++++"
  Vm.first.touch(:created_at) #updates the created_at attribute and updated_at/on   
  p "3+++++++++++++++++++++++++++++++++++"
  app = Application.create(name: "test_app")                                        
  p "4+++++++++++++++++++++++++++++++++++"
  app.vms.create(name: "vm3")                                                       
  p "5+++++++++++++++++++++++++++++++++++"
  sleep 5
  p "6+++++++++++++++++++++++++++++++++++"
  vm = Vm.find_by_name("vm3")
  p "7+++++++++++++++++++++++++++++++++++"
  vm.touch
  p "8+++++++++++++++++++++++++++++++++++"
	v = Vm.new 
  p "9+++++++++++++++++++++++++++++++++++"
  v.touch # v is not in database , so touch can not be used                         
rescue Exception => e
  p "10++++++++++++++++++++++++++++++++++"
  app.vms.map(&:destroy)                                                            
  p "11++++++++++++++++++++++++++++++++++"
  app.destroy                                                                       
  p "12++++++++++++++++++++++++++++++++++"
  p e.message 
end

#=>
#"1+++++++++++++++++++++++++++++++++++"
#"You have touched a vm!"
#"2+++++++++++++++++++++++++++++++++++"
#"You have touched a vm!"
#"3+++++++++++++++++++++++++++++++++++"
#"4+++++++++++++++++++++++++++++++++++"
#"You have touched an application"
#"5+++++++++++++++++++++++++++++++++++"
#"6+++++++++++++++++++++++++++++++++++"
#"7+++++++++++++++++++++++++++++++++++"
#"You have touched a vm!"
#"You have touched an application"
#"8+++++++++++++++++++++++++++++++++++"
#"9+++++++++++++++++++++++++++++++++++"
#"10++++++++++++++++++++++++++++++++++"
#"You have touched an application"
#"11++++++++++++++++++++++++++++++++++"
#"12++++++++++++++++++++++++++++++++++"
#"cannot touch on a new record object"


