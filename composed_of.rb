require "rubygems"
require "active_record"
puts ActiveRecord::Base.establish_connection(:adapter => "mysql", :host => "localhost", :database => "hycloud_portal")
class Cloud < ActiveRecord::Base
  composed_of :combo,
              :class_name => "Combo",
              :mapping => [[:name,:name],[:url,:url]]
end

class Combo
  attr_reader :name, :url
  def initialize(name,url)
    @name = name
    @url = url
  end
end

c = Cloud.find(1)
puts c.combo.name
puts c.combo.url

=begin
table:clouds
+----+---------+-----------------+---------------------------------------+------------+---------------------+---------------------+
| id | kind    | name            | url                                   | alias      | created_at          | updated_at          |
+----+---------+-----------------+---------------------------------------+------------+---------------------+---------------------+
|  1 | private | OpenStack       | http://192.168.1.151:5000/v2.0/tokens | OpenStack  | 2016-04-27 23:40:38 | 2016-05-20 22:06:24 |
|  2 | private | CloudStack      | NULL                                  | CloudStack | 2016-04-27 23:40:38 | 2016-04-27 23:40:38 |
|  3 | private | Ivic            | http://192.168.7.200/api/v0.1         | iVIC       | 2016-04-27 23:40:38 | 2016-04-27 23:40:38 |
|  4 | private | YanCloud        | http://222.29.159.162:8080/cloud/api  | YanCloud   | 2016-04-27 23:40:38 | 2016-04-27 23:40:38 |
|  5 | public  | Aliyun          | http://ecs.aliyuncs.com/v2.0/tokens   | Aliyun     | 2016-04-27 23:40:38 | 2016-04-27 23:40:38 |
|  6 | public  | BuaaPublicCloud | http://219.224.171.125/api/v0.1       | BuaaPCloud | 2016-04-27 23:40:38 | 2016-04-27 23:40:38 |
+----+---------+-----------------+---------------------------------------+------------+---------------------+---------------------+
=end

