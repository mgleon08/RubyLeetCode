# 443. String Compression

* [443. String Compression
](https://leetcode.com/problems/string-compression/)
* [In-place_algorithm](https://en.wikipedia.org/wiki/In-place_algorithm)

```ruby
Given an array of characters, compress it in-place.

The length after compression must always be smaller than or equal to the original array.

Every element of the array should be a character (not int) of length 1.

After you are done modifying the input array in-place, return the new length of the array.


Follow up:
Could you solve it using only O(1) extra space?


Example 1:

Input:
["a","a","b","b","c","c","c"]

Output:
Return 6, and the first 6 characters of the input array should be: ["a","2","b","2","c","3"]

Explanation:
"aa" is replaced by "a2". "bb" is replaced by "b2". "ccc" is replaced by "c3".


Example 2:

Input:
["a"]

Output:
Return 1, and the first 1 characters of the input array should be: ["a"]

Explanation:
Nothing is replaced.


Example 3:

Input:
["a","b","b","b","b","b","b","b","b","b","b","b","b"]

Output:
Return 4, and the first 4 characters of the input array should be: ["a","b","1","2"].

Explanation:
Since the character "a" does not repeat, it is not compressed. "bbbbbbbbbbbb" is replaced by "b12".
Notice each digit has it's own entry in the array.


Note:

All characters have an ASCII value in [35, 126].
1 <= len(chars) <= 1000.
```

# Version 1

```ruby
# @param {Character[]} chars
# @return {Integer}

def compress(chars)
  # 透過 mark 去註記每次記錄到哪個 index
  mark, counts = 0, 1
  [*0...chars.size].each do |i|
    if  i+1 != chars.size && chars[i] == chars[i+1]
      counts += 1
    else
      chars[mark] = chars[i]
      mark += 1
      if counts > 1
        # 將 counts 轉成 string 在個別塞到原本的 array 裡 e.g. 12 -> 1, 2
        counts.to_s.chars.each do |count|
          chars[mark] = count
          mark += 1
        end
        counts = 1
      end
    end
  end
  # 最後只截取到 mark 的長度
  chars[0...mark].size
end

puts compress(["a","a","b","b","c","c","c"])
puts compress(["a"])
puts compress(["a","b","b","b","b","b","b","b","b","b","b","b","b"])
```

Runtime: 72 ms
