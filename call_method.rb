# call is also a method , we can open class and overwrite it
# below is a add method , just like add(1).(2).(3) = 6 and add(1) = 1
def add(n)
  n
end
class Fixnum
  def call(n)
    self + n
  end
end
p add(1)    #=> 1
p add(1).(2).(3)    #=> 6
p add(2).(3).(4).(100)    #=> 109
