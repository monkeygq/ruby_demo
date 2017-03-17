class TreeNode                                                                                                                                                                                                
  attr_accessor :val, :left, :right
  def initialize(val)
    @val = val
    @left, @right = nil, nil
  end
end

m_1 = TreeNode.new(1)
m_2 = TreeNode.new(2)
m_3 = TreeNode.new(6)
m_4 = TreeNode.new(4)
m_5 = TreeNode.new(5)
m_1.left = m_2
m_1.right = m_3
m_2.left = m_4
m_2.right = m_5

# find a path's sum == sum
#==================
#                 =
#       m_1       =
#                 =
#        1        =
#       / \       =
#      2   3      =
#     / \         =
#    4   5        =
#==================

# simulate stack for preorder traversal
def mymain(root,arr,sum)
  if !root.nil?
    arr << root.val # push
    p arr if arr.reduce(:+) == sum
    mymain(root.left,arr,sum)
    mymain(root.right,arr,sum)
    arr.pop # pop
  end
end

mymain(m_1,[],7)

