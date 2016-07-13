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
