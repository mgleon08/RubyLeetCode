# 2. Add Two Numbers

[2. Add Two Numbers](https://leetcode.com/problems/add-two-numbers/)

```ruby
You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order and each of their nodes contain a single digit. Add the two numbers and return it as a linked list.

You may assume the two numbers do not contain any leading zero, except the number 0 itself.

Example:

Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
Output: 7 -> 0 -> 8
Explanation: 342 + 465 = 807.
```

# Version1

```ruby
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
```

# Version 2

在 leetcode 跑會失敗在

```go
input [9 9]
output [9 1]
expect [8 1]
```

但在 local 跑卻是正確的，猜想可能是 `tmpNum` 放在外面所導致的?

```ruby
@tmp_num = 0

def add_two_numbers(l1, l2)
  if l1.nil? && l2.nil?
    if @tmp_num != 0
      newNode = ListNode.new(@tmp_num)
      return newNode
    end
    return nil
  end

  if l1.nil?
    l2.val = l2.val + @tmp_num
    return l2
  end

  if l2.nil?
    l1.val = l1.val + @tmp_num
    return l1
  end

  val = l1.val + l2.val + @tmp_num
  @tmp_num = val / 10
  l1.val = val % 10
  l1.next = addTwoNumbers(l1.next, l2.next)
  l1
end
```
