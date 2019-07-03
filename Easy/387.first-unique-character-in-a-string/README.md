# 387. First Unique Character in a String

[387. First Unique Character in a String
](https://leetcode.com/problems/first-unique-character-in-a-string/submissions/)

```ruby
Given a string, find the first non-repeating character in it and return it's index. If it doesn't exist, return -1.

Examples:

s = "leetcode"
return 0.

s = "loveleetcode",
return 2.
Note: You may assume the string contain only lowercase letters.
```

# Version 1

```ruby
def first_uniq_char(s)
  return -1 if s.empty?
  hsh = Hash.new(0)
  s.chars.each do |char|
    hsh[char] += 1
  end
  s.chars.each_with_index do |char, index|
    return index if hsh[char] == 1
  end
  -1
end
```

Runtime: 312 ms

# Version 2

```ruby
def first_uniq_char(s)
  return -1 if s.empty?
  s.chars.uniq.each do |char|
    return s.index(char) if s.count(char) == 1
  end
  -1
end
```

Runtime: 144 ms

# Version 3

> The fastest way

```ruby
def first_uniq_char(s)
  return -1 if s.empty?
  # 先設定一個 size，一定大於 index
  min_dex = s.size
  ('a'..'z').each do |char|
    # 取最左邊跟最右邊 match 的 index
    left, right = s.index(char), s.rindex(char)
    # 有最左邊(至少有一個) / 左右相等(只有一個) / 比目前找到最小的 index 還小
    min_dex = left if left && left == right && left < min_dex
  end
  min_dex != s.size ? min_dex : -1
end
```

Runtime: 48 ms
