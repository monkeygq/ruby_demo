require "rubygems"
require "active_record"
puts ActiveRecord::Base.establish_connection(:adapter => "mysql", :host => "localhost", :database => "hycloud_portal")

class Cloud < ActiveRecord::Base
  before_create :myupcase
  validates_uniqueness_of :name,
                          :on => :create,
                          :message => "duplicate name"  
  validates_length_of :name,
                      :in => 3..15,
                      :message => "name is too long"
  private # or protected
  def myupcase
    self.name.gsub!(/h/, 'H') # use gsub is wrong , self.name could not be changed
  end
end

c = Cloud.new
c.name = "OpenStack"
c.save
p c.errors #=> #<ActiveModel::Errors:0x00000001940858 @base=#<Cloud id: nil, kind: nil, name: "OpenStack", url: nil, alias: nil, created_at: nil, updated_at: nil>, @messages={:name=>["duplicate name"]}>

p c.errors.messages[:name] #=> ["duplicate name"]

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
+----+---------+-----------------+--------------------------------------+------------+---------------------+---------------------+

=end

c = Cloud.new
c.name = "huaweiyun"
c.save	# h=>H by before_create

=begin
tables:clouds
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


