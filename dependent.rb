require 'active_record'
ActiveRecord::Base.establish_connection(adapter: :mysql2, host: :localhost, database: :hycloud_portal)

class Vm < ActiveRecord::Base
  belongs_to :application
end
class Application < ActiveRecord::Base
  has_many :vms, dependent: :destroy
end
app = Application.create(name: "test_app")
app.vms.create(name: "vm3")
app.vms.create(name: "vm4")

app.destroy # app.vms are all destroyed by dependent: :destroy



