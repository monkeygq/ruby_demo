str = ""
str = <<-CODE
1
2
3
4
5
CODE
p str #=> "1\n2\n3\n4\n5\n"

str = <<~CODE # <<~ is ruby 2.3's new post
        1
        2
        3
        4
        5
      CODE
p str #=> "1\n2\n3\n4\n5\n"

str = <<-CODE
        1
        2
        3
        4
        5
      CODE

p str #=> "        1\n        2\n        3\n        4\n        5\n"

str = <<CODE, __FILE__, __LINE__ + 1
1
2
3
4
5
CODE
p str #=> ["1\n2\n3\n4\n5\n", "here_document.rb", 12]

p str.instance_eval <<-CODE, __FILE__, __LINE__ + 1
  def test
    233
  end
CODE

