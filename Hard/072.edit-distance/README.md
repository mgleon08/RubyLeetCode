# 72. Edit Distance

[72. Edit Distance](https://leetcode.com/problems/edit-distance/)

```ruby
Given two words word1 and word2, find the minimum number of operations required to convert word1 to word2.

You have the following 3 operations permitted on a word:

Insert a character
Delete a character
Replace a character
Example 1:

Input: word1 = "horse", word2 = "ros"
Output: 3
Explanation:
horse -> rorse (replace 'h' with 'r')
rorse -> rose (remove 'r')
rose -> ros (remove 'e')
Example 2:

Input: word1 = "intention", word2 = "execution"
Output: 5
Explanation:
intention -> inention (remove 't')
inention -> enention (replace 'i' with 'e')
enention -> exention (replace 'n' with 'x')
exention -> exection (replace 'n' with 'c')
exection -> execution (insert 'u')
```

# Version 1

這是一個經典的演算法，由俄羅斯科學家 Vladimir Levenshtein 在 1965 年提出這個概念。

這題主要是用到了，DP(Dynamic Programming) 這個概念來解

- [72. Edit Distance](https://leetcode.com/articles/edit-distance/)
- [編輯距離演算法（Levenshtein）](https://tw.saowen.com/a/633d345525ad4da6f65d03e172777ee1749e8cbce92c3b225ae63c123ea61ebb)
- [[理工] 演算法 min edit 請教](https://www.ptt.cc/bbs/Grad-ProbAsk/M.1470239320.A.268.html)
- [動態規劃(DP)的整理-Python 描述](https://blog.csdn.net/MrLevo520/article/details/75676160)
- [Dynamic Programming](http://www.csie.ntnu.edu.tw/~u91029/DynamicProgramming.html)

```ruby
# 中間每個數字，都代表兩個字串相等時，所需的最小步驟
# 像是 hor -> ro 需要三個步驟
# hors -> X 需要四個步驟
e [5 4 4 3]
s [4 3 3 2]
r [3 2 3 2]
o [2 2 1 2]
h [1 1 2 3]
X [0 1 2 3]
X  X r o s
```

```ruby
# @param {String} word1
# @param {String} word2
# @return {Integer}
require 'pry'
def min_distance(word1, word2)
  len1, len2 = word1.size, word2.size
  # 如果其中一個長度是0，最小距離就會是兩個加起來
  return len1 + len2 if len1 * len2 == 0
  # 組一個二維陣列，用於記錄每次最小的步驟
  # +1 是考慮到DP中，一個串為空的情況
  arr_2d = Array.new(len1+1){ Array.new(len2+1) }
  # 初始化 Array
  (len1+1).times { |i| arr_2d[i][0] = i }
  (len2+1).times { |j| arr_2d[0][j] = j }
  # Dynamic Programming 計算
  1.upto(len1).each do |i|
    1.upto(len2).each do |j|
      # 左邊和下面因為少一個字，所以一定會多一個步驟
      left = arr_2d[i - 1][j] + 1
      down = arr_2d[i][j - 1] + 1
      # 中間的字，如果不相等，那就要多一個步驟才能變成一樣
      left_down = arr_2d[i - 1][j - 1]
      left_down += 1 if (word1[i - 1] != word2[j - 1])
      # 將裡面最小值，填入新的欄位
      arr_2d[i][j] = [left, down, left_down].min
    end
  end
  # 最後面一個就是可以組成兩個字相等時所需的最小步驟
  arr_2d[len1][len2]
end

word1, word2 = "horse", "ros"
puts min_distance(word1, word2)
word1, word2 = "intention", "execution"
puts min_distance(word1, word2)
```

Runtime: 172 ms
