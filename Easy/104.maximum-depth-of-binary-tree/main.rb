# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @return {Integer}
def max_depth(root)
  root ? 1 + [max_depth(root.left), max_depth(root.right)].max : 0
end

class TreeNode
    attr_accessor :val, :left, :right
    def initialize(val)
        @val = val
        @left, @right = nil, nil
    end
end

one = TreeNode.new(3)
two = TreeNode.new(9)
three = TreeNode.new(20)
four = TreeNode.new(15)
five = TreeNode.new(7)

one.left = two
one.right = three
three.left = four
three.right = five

puts max_depth(one)
