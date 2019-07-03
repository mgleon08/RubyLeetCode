# @param {String} s
# @return {String[][]}
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

puts partition("aab")
puts partition("cdd")
puts partition("eee")
