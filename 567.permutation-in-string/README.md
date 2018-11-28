# 567. Permutation in String

* [567. Permutation in String
](https://leetcode.com/problems/permutation-in-string/)
* [Sliding Window Protocol](http://ecomputernotes.com/computernetworkingnotes/communication-networks/sliding-window-protocol)

```ruby
Given two strings s1 and s2, write a function to return true if s2 contains the permutation of s1. In other words, one of the first string's permutations is the substring of the second string.

Example 1:
Input:s1 = "ab" s2 = "eidbaooo"
Output:True
Explanation: s2 contains one permutation of s1 ("ba").

Example 2:
Input:s1= "ab" s2 = "eidboaoo"
Output: False

Note:
The input strings only contain lower case letters.
The length of both given strings is in range [1, 10,000].
```

# Version 1

* [permutation](https://apidock.com/ruby/Array/permutation)

Ruby 本身就有個 method 可以直接將 sting 做出所有的組合，暴力解法，但是會 `Time Limit Exceeded`

```ruby
def check_inclusion(s1, s2)
  pers = s1.chars.permutation.to_a.map{ |a| a.join("") }
  pers.each do |per|
    return true if s2.match(per)
  end
  false
end
```

Runtime: Time Limit Exceeded

# Version 2

```ruby
def check_inclusion(s1, s2)
  hsh1 = Hash.new(0)
  hsh2 = Hash.new(0)
  s1_size = s1.size

  # 先將 s1 的 string 組成 mapping 的對照組
  s1.each_char do |ch|
    hsh1[ch] += 1
  end

  # 利用 s1 的 size，組成一個 sliding window
  (0...s1_size).each do |i|
    hsh2[s2[i]] += 1
  end

  # 確認第一個 sliding window 是否 mapping
  return true if hsh1 == hsh2

  # 接著向右移動 sliding window，一次移動一格，相對的左邊就少一格，
  (s1_size...s2.size).each do |i|
      hsh2[s2[i]] += 1
      hsh2[s2[i-s1_size]] -= 1
      # 如果扣到 0，就拿掉該 key
      hsh2.delete(s2[i-s1_size]) if hsh2[s2[i-s1_size]] == 0
      return true if hsh1 == hsh2
  end
  return false
end
```

Runtime: 108 ms
