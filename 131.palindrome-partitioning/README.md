# 131. Palindrome Partitioning

[131. Palindrome Partitioning](https://leetcode.com/problems/palindrome-partitioning/)

```ruby
Given a string s, partition s such that every substring of the partition is a palindrome.

Return all possible palindrome partitioning of s.

Example:

Input: "aab"
Output:
[
  ["aa","b"],
  ["a","a","b"]
]
```

* [Palindrome](http://www.csie.ntnu.edu.tw/~u91029/Palindrome.html)
* [Backtracking](http://www.csie.ntnu.edu.tw/~u91029/Backtracking.html)
* [Graph: Depth-First Search(DFS，深度優先搜尋)](http://alrightchiu.github.io/SecondRound/graph-depth-first-searchdfsshen-du-you-xian-sou-xun.html)
* [深度優先搜尋法 (Depth-first Search)](http://simonsays-tw.com/web/DFS-BFS/DepthFirstSearch.html)
* [Dynamic Programming](http://www.csie.ntnu.edu.tw/~u91029/DynamicProgramming.html)
* [What's the difference between backtracking and depth first search?](https://stackoverflow.com/questions/1294720/whats-the-difference-between-backtracking-and-depth-first-search)

# Version 1

```ruby
def partition(s)
  dfs(s, [], [])
end

def dfs(s, list, result)
  # 只有前面都有對應到的，才會到最後面，否則再判斷 Palindrome 就會跳掉
  result.push(list) if s.size == 0
  [*1..s.size].each do |index|
    # 如果是 Palindrome 就將它加入 list, 並將後面的字段，繼續做判斷
    if is_palindrome(s[0...index])
      # list 必須用 dup，因為原本的 list 會繼續對應下面的字串
      dfs(s[index..-1], list.dup.push(s[0...index]), result)
    end
  end
  result
end

def is_palindrome(s)
  s == s.reverse
end
```

Runtime: 164 ms

# Version 2

其他人解法，可參考看看 [qqnc/leetcode-1/palindrome_partitioning](https://github.com/qqnc/leetcode-1/blob/master/algorithms/palindrome_partitioning.rb)

```ruby
def partition(s)
  [].tap { |result| _partition_(s, 0, [], result) }
end

private def _partition_(s, spt, tracing, result)
  if spt == s.size
    result << tracing; return
  end

  spt.upto(s.size - 1) do |ubound|
    l, u = spt, ubound
    while l < u && s[l] == s[u]
      l += 1; u -= 1
    end
    next if s[l] != s[u]

    _partition_(s, ubound + 1, tracing.dup << s[spt..ubound], result)
  end
```

Runtime: 156 ms

# Flow

### aab

```go
1.1 aab, a, list = [a], next = ab
  2.1 ab, a, list = [a a], next = b
    3.1 b, b, list = [a a b] return
  2.2 ab, ab, list = [a] false
1.2 aab, aa, list = [aa], next = b
  2.1 b, b, list = [aa b] return
1.3 aab, aab, list = [] false

// [[a a b] [aa b]]
```

### eee

```go
1.1 eee, e, list = [e], next = ee
  2.1 ee, e, list = [e e], next = e
    3.1 e, e, list = [e e e] return
  2.2 ee, ee, list = [e ee] return
1.2 eee, ee, list = [ee], next = e
  2.1 e, e, list = [ee e] return
1.3 eee, eee, list = [eee] return

// [[e e e] [e ee] [ee e] [eee]]
```
