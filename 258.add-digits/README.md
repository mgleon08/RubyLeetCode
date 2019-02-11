# 258. Add Digits

[258. Add Digits](https://leetcode.com/problems/add-digits/)

```ruby
Given a non-negative integer num, repeatedly add all its digits until the result has only one digit.

Example:

Input: 38
Output: 2
Explanation: The process is like: 3 + 8 = 11, 1 + 1 = 2.
             Since 2 has only one digit, return it.
Follow up:
Could you do it without any loop/recursion in O(1) runtime?
```

# Version 1

```ruby
# @param {Integer} num
# @return {Integer}
def add_digits(num)
  while num / 10 != 0
    num = (num / 10) + (num % 10)
  end
  num
end

puts add_digits(38)
```
