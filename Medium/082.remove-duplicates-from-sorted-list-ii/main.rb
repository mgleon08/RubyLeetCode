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
[1, 1, 1, 2, 3, 3, 4, 4, 5].each_with_object({}).with_index(1) do |(val, hash), index|
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
