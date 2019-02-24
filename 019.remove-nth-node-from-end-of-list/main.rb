# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end

# @param {ListNode} head
# @param {Integer} n
# @return {ListNode}

def remove_nth_from_end(head, n)
  nodes = Hash.new
  index = 0

  while head != nil
    nodes[index] = head
    index += 1
    head = head.next
  end

	lenght = nodes.size
	nth = lenght - n
	if nth > 0
		head = nodes[0]
		# nth 剛好是要拿掉的那個點，因此將上一個 node 跳過這一個 node 連到下一個
		nodes[nth-1].next = nodes[nth].next
	elsif lenght > 1
		head = nodes[1]
	else
		head = nil
  end

	return head
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
list_node1 = create_node(vals)
node = remove_nth_from_end(list_node1["node1"], 2)

while node != nil
    puts node.val
    node = node.next
end
