# 796. Rotate String

[796. Rotate String](https://leetcode.com/problems/rotate-string/)

```ruby
We are given two strings, A and B.

A shift on A consists of taking string A and moving the leftmost character to the rightmost position. For example, if A = 'abcde', then it will be 'bcdea' after one shift on A. Return True if and only if A can become B after some number of shifts on A.

Example 1:
Input: A = 'abcde', B = 'cdeab'
Output: true

Example 2:
Input: A = 'abcde', B = 'abced'
Output: false
Note:

A and B will have length at most 100.
```

# Version 1

```ruby
# @param {String} a
# @param {String} b
# @return {Boolean}
def rotate_string(a, b)
  a.size == b.size && (a + a).include?(b)
end

string1 = "abcde"
string2 = "cdeab"
puts rotate_string(string1, string2)

string2 = "abced"
puts rotate_string(string1, string2)

string1 = "aa"
string2 = "a"
puts rotate_string(string1, string2)
```

Runtime: 44 ms
