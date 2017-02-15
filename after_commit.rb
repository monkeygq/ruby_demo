require 'active_record'
ActiveRecord::Base.establish_connection(adapter: :mysql2, host: :localhost, database: :hycloud_portal)

class Vm < ActiveRecord::Base
  after_commit :test
  #after_save :test
  private
  def test
    raise "233"
  end
end

begin
  Vm.create
rescue Exception => e
  p e.message #=> "233"
end

# after_commit is after the transaction(Vm.create) , so Vm table add a record , then raise exception
# after_save is in the transation(Vm.create) , the transaction raises exception and rollbacks ,so Vm table does not add a record
