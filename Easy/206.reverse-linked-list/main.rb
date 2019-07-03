# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end

# @param {ListNode} head
# @return {ListNode}
def reverse_list(head)
  list = []
  copy_head = ListNode.new(0)
  copy_head.next = head
  start = copy_head
  while head != nil
     list << head.val
      head = head.next
  end
  list.reverse.each do |n|
      copy_head = copy_head.next
      copy_head.val = n
  end
  start.next
end

class ListNode
  attr_accessor :val, :next
  def initialize(val)
      @val = val
      @next = nil
  end
end

def create_node(vals)
  list_node = vals.each_with_object({}).with_index(1) do |(val, hash), index|
    hash["node#{index}"] = ListNode.new(val)
  end

  for num in 1..(list_node.size - 1)
    list_node["node#{num}"].next = list_node["node#{num+1}"]
  end
  list_node
end

vals = [1, 2, 3, 4, 5]
list_node = create_node(vals)

node = reverse_list(list_node['node1'])

while node != nil
  puts node.val
  node = node.next
end
