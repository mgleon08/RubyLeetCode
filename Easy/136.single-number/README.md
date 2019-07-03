# 136. Single Number

[136. Single Number](https://leetcode.com/problems/single-number/)

```ruby
Given a non-empty array of integers, every element appears twice except for one. Find that single one.

Note:

Your algorithm should have a linear runtime complexity. Could you implement it without using extra memory?

Example 1:

Input: [2,2,1]
Output: 1
Example 2:

Input: [4,1,2,1,2]
Output: 4
```

# Version 1

```ruby
def single_number(nums)
  count = 0
  nums_sort = nums.sort
  nums_sort.each_with_index do |num, index|
    if nums_sort[index + 1] == num
      count += 1
    else
     return num if count == 0
     count = 0
    end
  end
end
```

# Version 2

```ruby
def single_number(nums)
    hash = Hash.new(0)
    nums.each do |num|
        hash[num]+=1
    end
    hash.key(1)
end
```

# Version 3

`^` is `XOR`

ruby will use binary like

- [4,1,2,1,2] = [100, 001, 010, 001, 010]
- 100 ^ 001 = 101
- 101 ^ 010 = 111
- 111 ^ 001 = 110
- 110 ^ 010 = 100 = 4

```ruby
def single_number(nums)
  nums.inject(&:^)
end
```
