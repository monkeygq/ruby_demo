require "rubygems"
require "active_record"
puts ActiveRecord::Base.establish_connection(:adapter => "mysql", :host => "localhost", :database => "hycloud_portal")
class NetworkPrice < ActiveRecord::Base
  validates_format_of :price, :with => /^\d+(.\d+)?$/  # nonnegative number
  def add(num)
    change(num)
  end
  def minus(num)
    change(-num)  #highlight
  end
  protected
  def change(num)
    self.price += num
    self.save!  # save is wrong , because save! is able to throw an exception. 
                # Only if there is an exception in the block of transaction,
                # the operations of the database of the block will be rolled back.
  end
end

=begin
table:network_prices
+----+----------+-----------+-------+---------------------+---------------------+
| id | cloud_id | bandwidth | price | created_at          | updated_at          |
+----+----------+-----------+-------+---------------------+---------------------+
|  3 |     NULL |      NULL |   100 | 2016-07-21 17:08:01 | 2016-07-21 17:08:01 |
|  4 |     NULL |      NULL |   200 | 2016-07-21 17:08:01 | 2016-07-21 17:08:01 |
+----+----------+-----------+-------+---------------------+---------------------+
=end

# a.price(minus) gives to b.price(add) . price can't be < 0 , if price < 0 , the operations of database will be rolled back.
a = NetworkPrice.find(3)
b = NetworkPrice.find(4)
begin
  NetworkPrice.transaction do
    b.add(1000)
    a.minus(1000)
  end
rescue Exception => e
  p "exception"
  # model objects have been changed , this is not what I want to see
  puts "a.price=#{a.price}"    #=> a.price=-900.0
  puts "b.price=#{b.price}"    #=> b.price=1200.0
end

#below is a better way
a = NetworkPrice.find(3)
b = NetworkPrice.find(4)
begin
  NetworkPrice.transaction(a, b) do  # pass model objects as parameters to transaction,
                                     # if the operations of database are rolled back , the model objects will be rolled back.
    b.add(1000)
    a.minus(1000)
  end
rescue Exception => e
  p "exception"
  puts "a.price=#{a.price}"    #=> a.price=100.0
  puts "b.price=#{b.price}"    #=> b.price=200.0
end





