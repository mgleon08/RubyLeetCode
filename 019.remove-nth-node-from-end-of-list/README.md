# 19. Remove Nth Node From End of List

[19. Remove Nth Node From End of List](https://leetcode.com/problems/remove-nth-node-from-end-of-list/)

```ruby
Given a linked list, remove the n-th node from the end of list and return its head.

Example:

Given linked list: 1->2->3->4->5, and n = 2.

After removing the second node from the end, the linked list becomes 1->2->3->5.
Note:

Given n will always be valid.

Follow up:

Could you do this in one pass?
```

# Version1

```ruby
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
```

# Version 2

```ruby
def remove_nth_from_end(head, n)
  new_head = ListNode.new(0)
	new_head.next = head
	current_head = head

	count = 0
	while current_head != nil
		count += 1
		current_head = current_head.next
  end

	index = count - n
	current_head = new_head
	while index > 0
		index -= 1
		current_head = current_head.next
  end
	current_head.next = current_head.next.next
	new_head.next
end
```
