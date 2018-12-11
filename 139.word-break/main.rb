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

s = "leetcode"
word_dict = ["leet", "code"]
puts word_break(s, word_dict)

s = "applepenapple"
word_dict = ["apple", "pen"]
puts word_break(s, word_dict)

s = "catsandog"
word_dict = ["cats", "dog", "sand", "and", "cat"]
puts word_break(s, word_dict)

s = "aaaaaaa"
word_dict = ["aaaa","aaa"]
puts word_break(s, word_dict)
