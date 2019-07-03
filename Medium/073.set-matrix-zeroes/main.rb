# @param {Integer[][]} matrix
# @return {Void} Do not return anything, modify matrix in-place instead.
def set_zeroes(matrix)
  row_len = matrix.length
  col_len = matrix[0].length
  # 建立 col 和 row 的 map 來記錄
  row_map = Array.new(row_len)
  col_map = Array.new(col_len)

  # 只要有 0 就記錄在 row_map && col_map
  [*0...row_len].each do |row|
    [*0...col_len].each do |column|
      if matrix[row][column] == 0
        row_map[row] = 1
        col_map[column] = 1
      end
    end
  end

  # 接著只要 row_map 或是 col_map 有 1 就改成 0
  [*0...row_len].each do |row|
    [*0...col_len].each do |column|
      if row_map[row] == 1 || col_map[column] == 1
        matrix[row][column] = 0
      end
    end
  end
end

matrix =
[
  [1,1,1],
  [1,0,1],
  [1,1,1]
]

set_zeroes(matrix)
puts matrix.inspect

matrix =
[
  [0,1,2,0],
  [3,4,5,2],
  [1,3,1,5]
]

set_zeroes(matrix)
puts matrix.inspect
