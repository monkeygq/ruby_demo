def div3(num)
  num =~ /^1((10*1)|(01*0))*10*$/ ? true : false
end


# three states:
# 0 state : num % 3 = 0
# 1 state : num % 3 = 1
# 2 state : num % 3 = 2
# 0 + 0 => 0 
# means : a num % 3 equals 0 , then , (num * 2) % 3 equals 0.
#
# 0 + 1 => 1
# means : a num % 3 equals 0 , then , (num * 2 + 1) % 3 equals 1.
#
# 1 + 0 => 2
# means : a num % 3 equals 1 , then , (num * 2) % 3 equals 2.
#
# 1 + 1 => 0
# 2 + 0 => 1
# 2 + 1 => 2
#
#                          0
#                         / \
#                         \ /
#                          0 
#                         //\
#                      1 // 
#                       // 1
#                     \//           
#                      1
#                     /\\ 
#                       \\ 0
#                      0 \\
#                         \\/
#                          2
#                         / \
#                         \ /
#                          1 
#
# begin of 1 state
# (10*1) means from 1 state to 0 state(can loop at 0 state) , then , back to 1 state
# in the same way
# (01*0) means from 1 state to 2 state(can loop at 2 state) , then , back to 1 state
# 1 means from 1 state to 0 state , at this time , the num can be divided by 3
# 0* means if a num % 3 = 0 , then , (num * 2) % 3 = 0 , too 
# so  ^1((10*1)|(01*0))*10*$








