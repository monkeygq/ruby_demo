setup do
  puts "set up curent height"
  @current = 100
end

setup do
  puts "set up max height"
  @max = 200
end

event "we are init" do
  @current <= 200
end

event "we are a little dangerous" do
  @current >= 100 && @current < 150
end

