class TreeNode                                                                                                                                                                                                
  attr_accessor :val, :left, :right
  def initialize(val)
    @val = val 
    @left, @right = nil, nil 
  end 
end

m_1 = TreeNode.new(1)
m_2 = TreeNode.new(2)
m_3 = TreeNode.new(3)
m_4 = TreeNode.new(4)
m_5 = TreeNode.new(5)
s_2 = TreeNode.new(2)
s_4 = TreeNode.new(4)
s_5 = TreeNode.new(5)
m_1.left = m_2 
m_1.right = m_3 
m_2.left = m_4 
m_2.right = m_5 

s_2.left = s_4 
s_2.right = s_5 

#===========================
#  if p2 is p1's subtree   =
#                          =
#       p1          p2     =
#                          =
#        1          2      =
#       / \        / \     =
#      2   3      4   5    =
#     / \                  =
#    4   5                 =
#===========================
def helper(p1, p2) 
  if p2.nil?
    return true
  elsif p1.nil?
    return false
  elsif p1.val != p2.val
    return false
  else
    return helper(p1.left, p2.left) && helper(p1.right, p2.right)
  end 
end

def mymain(p1, p2) 
  flag = false
  if !p1.nil? && !p2.nil?
    if p1.val == p2.val
      flag = helper(p1, p2) 
    end 
    if !flag
      flag = mymain(p1.left, p2) 
    end 
    if !flag
      flag = mymain(p1.right, p2) 
    end 
  end 
  return flag
end

p mymain(m_1, s_2) #=> true

