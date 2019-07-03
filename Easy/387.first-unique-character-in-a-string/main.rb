# Version 1
# def first_uniq_char(s)
#   return -1 if s.empty?
#   hsh = Hash.new(0)
#   s.chars.each do |char|
#     hsh[char] += 1
#   end
#   s.chars.each_with_index do |char, index|
#     return index if hsh[char] == 1
#   end
#   -1
# end

# Version 2
# def first_uniq_char(s)
#   return -1 if s.empty?
#   s.chars.uniq.each do |char|
#     return s.index(char) if s.count(char) == 1
#   end
#   -1
# end

# Version 3
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

puts first_uniq_char("leetcode")
puts first_uniq_char("loveleetcode")
puts first_uniq_char("")
puts first_uniq_char("cc")
