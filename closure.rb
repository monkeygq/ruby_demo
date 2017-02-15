#Build a function(test) using closures
def test
  p 'before closure'
  yield #call closure
  p 'after closure'
end

test { p 'I am closure'} #closure is a parameter
#=>
#"before closure"
#"I am closure"
#"after closure"

#===========================================================>

def test2
  a = 'para1'
  b = 'para2'
  yield(a, b)
end

test2 { |x, y| p [x, y].join('-')}
#=>"para1-para2" 

#===========================================================>

def test3
  topic = 'hello world'
  name = 'hgq'
  p topic
  yield(topic, name)
  p name
end

t = ""
n = ""
test3 do |x, y|
  p "I am closure"
  t = x
  n = y
end

p "t=#{t}"
p "n=#{n}"
#=>
#"hello world"
#"I am closure"
#"hgq"
#"t=hello world"
#"n=hgq"
