require 'rack'
class Hello
  def get_request
    p @request ||= Rack::Request.new(@env)
  end

  def response(text, status=200, head={})
    raise "respond" if @respond
    text = [text].flatten
    p "I am response"
    @response = Rack::Response.new(text, status, head)
  end

  def get_response
    @response || response([])
  end

  %W{get? put? post? delete? patch? trace?}.each do |md|
    define_method md do
      get_request.send(md.intern)
    end
  end
  %W{body headers length= status=  body= header length redirect status content_length content_type}.each do |md|
    define_method md do |*arg|
      get_response.send(md.intern, *arg)
    end
  end

  def call(env)
    p status
    p headers
    p body
    @env = env
    content_type   = 'text/plain'
    if get?
      body= ['you send a get request']
    else
      status= 403
      body= ['we do not support request method except get, please try another.']
    end
    [status, headers, body]
  end
end
Rack::Handler::Thin.run Hello.new, :Port => 9292

#=> startup cmd : ruby rack.rb
