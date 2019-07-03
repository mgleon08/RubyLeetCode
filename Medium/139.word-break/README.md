# 139. Word Break

[139. Word Break](https://leetcode.com/problems/word-break//)

```ruby
Given a non-empty string s and a dictionary wordDict containing a list of non-empty words, determine if s can be segmented into a space-separated sequence of one or more dictionary words.

Note:

The same word in the dictionary may be reused multiple times in the segmentation.
You may assume the dictionary does not contain duplicate words.
Example 1:

Input: s = "leetcode", wordDict = ["leet", "code"]
Output: true
Explanation: Return true because "leetcode" can be segmented as "leet code".
Example 2:

Input: s = "applepenapple", wordDict = ["apple", "pen"]
Output: true
Explanation: Return true because "applepenapple" can be segmented as "apple pen apple".
             Note that you are allowed to reuse a dictionary word.
Example 3:

Input: s = "catsandog", wordDict = ["cats", "dog", "sand", "and", "cat"]
Output: false

```

* [Backtracking](http://www.csie.ntnu.edu.tw/~u91029/Backtracking.html)
* [Graph: Depth-First Search(DFS，深度優先搜尋)](http://alrightchiu.github.io/SecondRound/graph-depth-first-searchdfsshen-du-you-xian-sou-xun.html)
* [深度優先搜尋法 (Depth-first Search)](http://simonsays-tw.com/web/DFS-BFS/DepthFirstSearch.html)
* [Dynamic Programming](http://www.csie.ntnu.edu.tw/~u91029/DynamicProgramming.html)
* [What's the difference between backtracking and depth first search?](https://stackoverflow.com/questions/1294720/whats-the-difference-between-backtracking-and-depth-first-search)

# Version 1

```ruby
# @param {String} s
# @param {String[]} word_dict
# @return {Boolean}

def word_break(s, word_dict)
  is_matched?(s, 0, word_dict, Array.new(s.size))
end

def is_matched?(s, start, word_dict, mark_arr)
  # 如果最後一個已經 matched，就不用繼續下去，直接 return
  return true if mark_arr.last
  [*start..(s.size-1)].each do |index|
    # 有 matchd 過就繼續下一個
    next if mark_arr[index]
    if word_dict.include? s[start..index]
      # 如果有 matched 就註記
      mark_arr[index] = true
      return true if is_matched?(s, index+1, word_dict, mark_arr)
    end
  end
  false
end
```

Runtime: 52 ms


# Version 2

> leetcode fastest way

```ruby
def word_break(s, word_dict)
  # similar to a Chinese NLP word segmentation process (there are no spaces in Chinese text.)
  # use an algorithm called maximum matching; 
  # only using forward maxmimal matching will lead to some false negatives, so we need to try backwords forward matching, too.
  
  # 先做長度排序
  word_dict = word_dict.sort_by { |x| x.length }.reverse
  # 複製一份用來做反向驗證
  bmm = s.dup
  
  # 正向驗證
  word_dict.each do |word|
    # 將所有對應到的字轉化成 *，因為沒有對應到會回傳 nil
    s.gsub!(word, "*")
    return true if s.gsub("*", "").empty?
  end
  
  # 反向驗證
  word_dict.reverse.each do |word|
   # 將所有對應到的字轉化成 *，因為沒有對應到會回傳 nil
   bmm.gsub!(word, "*")
   return true if bmm.gsub("*", "").empty?
  end
  
  false
end
```

Runtime: 44 ms
