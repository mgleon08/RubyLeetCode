# 86. Partition List

[86. Partition List](https://leetcode.com/problems/partition-list/)

```ruby
Given a linked list and a value x, partition it such that all nodes less than x come before nodes greater than or equal to x.

You should preserve the original relative order of the nodes in each of the two partitions.

Example:

Input: head = 1->4->3->2->5->2, x = 3
Output: 1->2->2->4->3->5
```

# Version 1

```ruby
# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end

# @param {ListNode} head
# @param {Integer} x
# @return {ListNode}

def partition(head, x)
  new_head1 = ListNode.new(0)
  small_head = new_head1
  new_head2 = ListNode.new(0)
  big_head = new_head2

  while head != nil
    if head.val < x
      small_head.next = head
      small_head = small_head.next
    else
      big_head.next = head
      big_head = big_head.next
    end
    head = head.next
  end
  # 最後必須將最後的指向 nil
	big_head.next = nil
  # 將小的 list 和 大的 list 串再一起
	small_head.next = new_head2.next
  new_head1.next
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

vals = [1, 4, 3, 2, 5, 2]
list_node = create_node(vals)
node = partition(list_node["node1"], 3)

while node != nil
    puts node.val
    node = node.next
end
```
