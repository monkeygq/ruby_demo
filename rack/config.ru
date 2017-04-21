class ToUpper
  def initialize(app)
    @app = app
    p "ToUpper init"
    p @app
  end
  def call(env)
    p "toupper call"
    a, b, c = @app.call(env)
    [a, b, c.map(&:upcase)]
  end
end

class HelloWorld
  def initialize
    p "helloworld init"
    super
  end
  def call(env)
    p "helloworld call"
    [200, {"Content-Type" => "text/html"}, ["Hello Rack"]]
  end
end
use ToUpper
run HelloWorld.new

#invoke chain : ToUpper.new(HelloWorld.new).call(env)
#gem install rack
#file name must be : config.ru
#type cmd : rackup

#=>
#"helloworld init"
#"ToUpper init"
##<HelloWorld:0x00000001749388>
#Thin web server (v1.6.4 codename Gob Bluth)
#Maximum connections set to 1024
#Listening on localhost:9292, CTRL+C to stop
#"toupper call"
#"helloworld call"
#127.0.0.1 - - [21/Apr/2017:17:40:45 +0800] "GET / HTTP/1.1" 200 - 0.0008
#"toupper call"
#"helloworld call"
#127.0.0.1 - - [21/Apr/2017:17:40:45 +0800] "GET /favicon.ico HTTP/1.1" 200 - 0.0004
