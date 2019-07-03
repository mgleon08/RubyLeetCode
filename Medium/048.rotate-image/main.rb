# @param {Integer[][]} matrix
# @return {Void} Do not return anything, modify matrix in-place instead.

def rotate(matrix)
  # 不需包含最後一位，所以減 1
  len = matrix.length - 1
  # 只需要跑一邊，跑四個邊，就可以對調，因此先除 2
  [*0...(matrix.length/2)].each do |i|
    # 跑內圈
    [*i...len-i].each do |j|
      # 取得一開始的值
      tmp = matrix[i][j]
      # 定義一開始的位置
      nextX = j
      nextY = len - i
      # 跑四個邊
      4.times.each do
         # 和 tmp 值交換
        tmp, matrix[nextX][nextY] = matrix[nextX][nextY], tmp
        # 定義下一個位置
        tmpX = nextY
        nextY = len - nextX
        nextX = tmpX
      end
    end
  end
end

matrix =
[
  [1,2,3],
  [4,5,6],
  [7,8,9]
]

rotate(matrix)
puts matrix.inspect

matrix =
[
  [ 5, 1, 9,11],
  [ 2, 4, 8,10],
  [13, 3, 6, 7],
  [15,14,12,16]
]

rotate(matrix)
puts matrix.inspect
