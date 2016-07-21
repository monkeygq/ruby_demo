require "rubygems"
require "active_record"
puts ActiveRecord::Base.establish_connection(:adapter => "mysql", :host => "localhost", :database => "hycloud_portal")
class Cloud < ActiveRecord::Base
  before_save :encode
  after_save :decode
  after_find :decode
  private
  def encode
#    self.name.gsub!(/mon/,"MON")
    self.name.tr!("a-y","b-z")
  end
  def decode
#    self.name.gsub!(/MON/,"mon")
    self.name.tr!("b-z","a-y")
  end
end

c = Cloud.new
c.name = "monkeygq"
c.save
p c.name    #=> "monkeygq"

c = Cloud.find(c.id)
p c.name    #=> "monkeygq"

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
|  7 | NULL    | npolfzhr        | NULL                                 | NULL       | 2016-07-21 16:08:20 | 2016-07-21 16:08:20 |
+----+---------+-----------------+--------------------------------------+------------+---------------------+---------------------+

=end
