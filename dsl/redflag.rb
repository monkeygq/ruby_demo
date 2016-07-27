def setup(&p)
  @setups << p
end
def event(str, &p)
  @events << {:str => str, :p => p}
end
@setups = []
@events = []
load 'events.rb'
@events.each do |event|
  @setups.each do |setup|
    setup.call
  end
  puts event[:str]
  event[:p].call
end
