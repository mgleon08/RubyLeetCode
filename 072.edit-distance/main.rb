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
