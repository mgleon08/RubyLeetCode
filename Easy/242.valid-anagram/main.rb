# @param {String} s
# @param {String} t
# @return {Boolean}

# def is_anagram(s, t)
#   s.split("").sort == t.split("").sort
# end

def is_anagram(s, t)
  return false if s.size != t.size
  ('a'..'z').all? { |x| s.count(x) == t.count(x) }
end

puts is_anagram("anagram", "nagaram")
puts is_anagram("rat", "car")
