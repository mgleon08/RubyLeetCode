# def check_inclusion(s1, s2)
#   pers = s1.chars.permutation.to_a.map{ |a| a.join("") }
#   pers.each do |per|
#     return true if s2.match(per)
#   end
#   false
# end

def check_inclusion(s1, s2)
  hsh1 = Hash.new(0)
  hsh2 = Hash.new(0)
  s1_size = s1.size

  s1.each_char do |ch|
    hsh1[ch] += 1
  end

  (0...s1_size).each do |i|
    hsh2[s2[i]] += 1
  end

  return true if hsh1 == hsh2

  (s1_size...s2.size).each do |i|
      hsh2[s2[i]] += 1
      hsh2[s2[i-s1_size]] -= 1
      hsh2.delete(s2[i-s1_size]) if hsh2[s2[i-s1_size]] == 0
      return true if hsh1 == hsh2
  end
  return false
end

s1 = "ab"
s2 = "eidbaooo"
puts check_inclusion(s1, s2)

s1 = "ab"
s2 = "eidboaoo"
puts check_inclusion(s1, s2)

s1 = "prosperity"
s2 = "properties"
puts check_inclusion(s1, s2)

s1 = "a"
s2 = "ab"
puts check_inclusion(s1, s2)

s1 = "adc"
s2 = "dcda"
puts check_inclusion(s1, s2)

s1 = "abcdxabcde"
s2 = "abcdeabcdx"
puts check_inclusion(s1, s2)
