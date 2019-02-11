# 344. Reverse String

[344. Reverse String](https://leetcode.com/problems/reverse-string/)

```ruby
Write a function that reverses a string. The input string is given as an array of characters char[].

Do not allocate extra space for another array, you must do this by modifying the input array in-place with O(1) extra memory.

You may assume all the characters consist of printable ascii characters.

Example 1:

Input: ["h","e","l","l","o"]
Output: ["o","l","l","e","h"]
Example 2:

Input: ["H","a","n","n","a","h"]
Output: ["h","a","n","n","a","H"]
```

# Version 1

```ruby
# @param {Character[]} s
# @return {Void} Do not return anything, modify s in-place instead.
def reverse_string(s)
    tmp = String.new
    size = s.size - 1
    for i in 0..(size/2)
        tmp = s[i]
        s[i], s[size - i] = s[size - i], tmp
    end
    s
end

arr = ["h","e","l","l","o"]
puts reverse_string(arr).inspect

arr = ["H","a","n","n","a","h"]
puts reverse_string(arr).inspect

arr = ["A"," ","m","a","n",","," ","a"," ","p","l","a","n",","," ","a"," ","c","a","n","a","l",":"," ","P","a","n","a","m","a"]
puts reverse_string(arr).inspect
```
