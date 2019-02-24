# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end

# @param {ListNode} l1
# @param {ListNode} l2
# @return {ListNode}

def add_two_numbers(l1, l2)
  tmpNum = 0
  newHead = ListNode.new(0)
  currentHead = newHead
  while l1 != nil || l2 != nil || tmpNum != 0
    num1, num2 = 0, 0
    num1, l1 = l1.val, l1.next if l1 != nil
    num2, l2 = l2.val, l2.next if l2 != nil
		val = num1 + num2 + tmpNum
		tmpNum = val / 10
		currentHead.next =  ListNode.new(val % 10)
		currentHead = currentHead.next
  end
  newHead.next
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

vals = [2, 6, 3]
vals2 = [2, 6, 4]
# vals = [3, 8]
# vals2 = [8]
# vals = [5]
# vals2 = [5]
# vals = [9]
# vals2 = [9]
list_node1 = create_node(vals)
list_node2 = create_node(vals2)
node = add_two_numbers(list_node1["node1"], list_node2["node1"])

while node != nil
    puts node.val
    node = node.next
end
