# 82. Remove Duplicates from Sorted List II

[82. Remove Duplicates from Sorted List II](https://leetcode.com/problems/remove-duplicates-from-sorted-list-ii/)

```ruby
Given a sorted linked list, delete all nodes that have duplicate numbers, leaving only distinct numbers from the original list.

Example 1:

Input: 1->2->3->3->4->4->5
Output: 1->2->5

Example 2:

Input: 1->1->1->2->3
Output: 2->3
```

# Version 1

```ruby

def delete_duplicates(head)
  return head if head == nil || head.next == nil

  if head.val == head.next.val
    # 不斷檢查目前的 node val 和下一個 node val 是否一樣
    while head.next != nil && head.val == head.next.val
      # 一樣就將現在的 node 更改為下一個 node
      head = head.next
    end
    # 當確認當下的 node 跟下一個 node 是不一樣時，就取下一個 node 當作下次的 node
    # 原因 1, 1, 1, 2 會確認到 1, 2，但 1 在前面已經重複了，所以取 2
    return delete_duplicates(head.next)
  end
  # 沒有一樣的話，就直接將下一個 node assign
  head.next = delete_duplicates(head.next)
  head
end

class ListNode
  attr_accessor :val, :next
  def initialize(val)
      @val = val
      @next = nil
  end
end

list_node =
[1, 2, 3, 3, 4, 4, 5].each_with_object({}).with_index(1) do |(val, hash), index|
  hash["node#{index}"] = ListNode.new(val)
end

for num in 1..(list_node.size - 1)
  list_node["node#{num}"].next = list_node["node#{num+1}"]
end

node = delete_duplicates(list_node["node1"])

while node != nil
    puts node.val
    node = node.next
end
```

Runtime: 48 ms

# Version 2

```ruby
# 0->1->2->3->3->4->4->5
# 0->1->1->1->2->3

def delete_duplicates(head)
  # 建立新的 node 並和原本的 node 串連起來
  new_head = ListNode.new(0)
  new_head.next = head
  # 指向新的 node，指向同一個 object 但拿來當指標使用
  ptr = new_head
  # 指向新的 node 的下一個
  last = new_head.next

  while ptr.next != nil
    # 找出與 ptr 下一個不重複的 node
    while last.next != nil && last.next.val == ptr.next.val
      last = last.next
    end

    if last == ptr.next
      # 如果沒有重複，ptr & last 同時往後移一格在比較
      ptr = ptr.next
      last = ptr.next
    else
      # 有重複，將 ptr 指向到 last 的下一個
      ptr.next = last.next
    end
  end

  # 第一個是自己建立的，所以 return 重下一個開始
  new_head.next
end

class ListNode
  attr_accessor :val, :next
  def initialize(val)
      @val = val
      @next = nil
  end
end

list_node =
[1, 2, 3, 3, 4, 4, 5].each_with_object({}).with_index(1) do |(val, hash), index|
  hash["node#{index}"] = ListNode.new(val)
end

for num in 1..(list_node.size - 1)
  list_node["node#{num}"].next = list_node["node#{num+1}"]
end

node = delete_duplicates(list_node["node1"])

while node != nil
    puts node.val
    node = node.next
end
```

Runtime: 48 ms
