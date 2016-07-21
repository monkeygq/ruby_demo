require "rubygems"
require "active_record"
puts ActiveRecord::Base.establish_connection(:adapter => "mysql", :host => "localhost", :database => "hycloud_portal")
class Cloud < ActiveRecord::Base
  scope :myscope, ->(kind) {where(:kind => kind)} # lambda 
  scope :myscope_public, where(:kind => "public") 
end

p Cloud.myscope("private").size	#=> 4
p Cloud.myscope(nil).size	#=> 1
p Cloud.myscope_public.size			#=> 2

=begin
table:clouds
+----+---------+-----------------+--------------------------------------+------------+---------------------+---------------------+
| id | kind    | name            | url                                  | alias      | created_at          | updated_at          |
+----+---------+-----------------+--------------------------------------+------------+---------------------+---------------------+
|  1 | private | OpenStack       | http://192.168.7.27:5000/v2.0/tokens | OpenStack  | 2016-04-28 09:39:59 | 2016-07-08 22:26:22 |
|  2 | private | CloudStack      | NULL                                 | CloudStack | 2016-04-28 09:39:59 | 2016-04-28 09:39:59 |
|  3 | private | Ivic            | http://192.168.7.200/api/v0.1        | iVIC       | 2016-04-28 09:39:59 | 2016-04-28 09:39:59 |
|  4 | private | YanCloud        | http://222.29.159.162:8080/cloud/api | YanCloud   | 2016-04-28 09:39:59 | 2016-04-28 09:39:59 |
|  5 | public  | Aliyun          | http://ecs.aliyuncs.com/v2.0/tokens  | Aliyun     | 2016-04-28 09:39:59 | 2016-04-28 09:39:59 |
|  6 | public  | BuaaPublicCloud | http://219.224.171.125/api/v0.1      | BuaaPCloud | 2016-04-28 09:39:59 | 2016-04-28 09:39:59 |
|  7 | NULL    | Huaweiyun       | NULL                                 | NULL       | 2016-07-19 17:52:22 | 2016-07-19 17:52:22 |
+----+---------+-----------------+--------------------------------------+------------+---------------------+---------------------+

=end
