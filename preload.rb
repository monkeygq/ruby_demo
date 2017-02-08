require "rubygems"
require "active_record"
# use rails 5.0.0.1 mysql2
ActiveRecord::Base.establish_connection(:adapter => "mysql2", :host => "localhost", :database => "hycloud_portal")
class Vm < ActiveRecord::Base
  has_many :monitor_minutes
end
class MonitorMinute < ActiveRecord::Base
  belongs_to :vm
end
p Vm.eager_load(:monitor_minutes).where("monitor_minutes.cpu_usage = ?", 100) #=> #<ActiveRecord::Relation [#<Vm id: 1, name: "vm1", status: nil, cloud_vm_id: nil, application_id: nil, component_id: nil, clouds_user_id: nil, nginx_server_id: nil, ip: nil, duration: 0, user_id: nil, created_at: nil, updated_at: nil>]>

p Vm.includes(:monitor_minutes).where("monitor_minutes.cpu_usage = ?", 100).references(:monitor_minutes) #=> #<ActiveRecord::Relation [#<Vm id: 1, name: "vm1", status: nil, cloud_vm_id: nil, application_id: nil, component_id: nil, clouds_user_id: nil, nginx_server_id: nil, ip: nil, duration: 0, user_id: nil, created_at: nil, updated_at: nil>]>

p Vm.includes(:monitor_minutes).where("monitor_minutes.cpu_usage" => 100) #=> #<ActiveRecord::Relation [#<Vm id: 1, name: "vm1", status: nil, cloud_vm_id: nil, application_id: nil, component_id: nil, clouds_user_id: nil, nginx_server_id: nil, ip: nil, duration: 0, user_id: nil, created_at: nil, updated_at: nil>]>

res = Vm.joins(:monitor_minutes).where("monitor_minutes.cpu_usage = ?", 100).preload(:monitor_minutes)
p res[0] #=> #<Vm id: 1, name: "vm1", status: nil, cloud_vm_id: nil, application_id: nil, component_id: nil, clouds_user_id: nil, nginx_server_id: nil, ip: nil, duration: 0, user_id: nil, created_at: nil, updated_at: nil>

p res[0].monitor_minutes #=> #<ActiveRecord::Associations::CollectionProxy [#<MonitorMinute id: 3, vm_id: 1, hour: 1, minute: 1, cpu_usage: 100.0, mem_total: nil, mem_free: nil, disk_total: nil, disk_free: nil, disk_read: nil, disk_write: nil, vif_tx: nil, vif_rx: nil, created_at: nil, updated_at: nil>, #<MonitorMinute id: 4, vm_id: 1, hour: 1, minute: 2, cpu_usage: 50.0, mem_total: nil, mem_free: nil, disk_total: nil, disk_free: nil, disk_read: nil, disk_write: nil, vif_tx: nil, vif_rx: nil, created_at: nil, updated_at: nil>]>


#SELECT * FROM vms;
#+----+------+--------+-------------+----------------+--------------+----------------+-----------------+------+----------+---------+---------------------+---------------------+
#| id | name | status | cloud_vm_id | application_id | component_id | clouds_user_id | nginx_server_id | ip   | duration | user_id | created_at          | updated_at          |
#+----+------+--------+-------------+----------------+--------------+----------------+-----------------+------+----------+---------+---------------------+---------------------+
#|  1 | vm1  | NULL   | NULL        |           NULL |         NULL |           NULL |            NULL | NULL |        0 |    NULL | 0000-00-00 00:00:00 | 0000-00-00 00:00:00 |
#|  2 | vm2  | NULL   | NULL        |           NULL |         NULL |           NULL |            NULL | NULL |        0 |    NULL | 0000-00-00 00:00:00 | 0000-00-00 00:00:00 |
#+----+------+--------+-------------+----------------+--------------+----------------+-----------------+------+----------+---------+---------------------+---------------------+

#SELECT * FROM monitor_minutes;
#+----+-------+------+--------+-----------+-----------+----------+------------+-----------+-----------+------------+--------+--------+---------------------+---------------------+
#| id | vm_id | hour | minute | cpu_usage | mem_total | mem_free | disk_total | disk_free | disk_read | disk_write | vif_tx | vif_rx | created_at          | updated_at          |
#+----+-------+------+--------+-----------+-----------+----------+------------+-----------+-----------+------------+--------+--------+---------------------+---------------------+
#|  3 |     1 |    1 |      1 |       100 |      NULL |     NULL |       NULL |      NULL |      NULL |       NULL |   NULL |   NULL | 0000-00-00 00:00:00 | 0000-00-00 00:00:00 |
#|  4 |     1 |    1 |      2 |        50 |      NULL |     NULL |       NULL |      NULL |      NULL |       NULL |   NULL |   NULL | 0000-00-00 00:00:00 | 0000-00-00 00:00:00 |
#|  5 |     2 |    1 |      1 |        90 |      NULL |     NULL |       NULL |      NULL |      NULL |       NULL |   NULL |   NULL | 0000-00-00 00:00:00 | 0000-00-00 00:00:00 |
#|  6 |     2 |    1 |      2 |        50 |      NULL |     NULL |       NULL |      NULL |      NULL |       NULL |   NULL |   NULL | 0000-00-00 00:00:00 | 0000-00-00 00:00:00 |
#+----+-------+------+--------+-----------+-----------+----------+------------+-----------+-----------+------------+--------+--------+---------------------+---------------------+



