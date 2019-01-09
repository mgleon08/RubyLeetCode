# 73. Set Matrix Zeroes

[73. Set Matrix Zeroes](https://leetcode.com/problems/set-matrix-zeroes/)

```ruby
Given a m x n matrix, if an element is 0, set its entire row and column to 0. Do it in-place.

Example 1:

Input: 
[
  [1,1,1],
  [1,0,1],
  [1,1,1]
]
Output: 
[
  [1,0,1],
  [0,0,0],
  [1,0,1]
]
Example 2:

Input: 
[
  [0,1,2,0],
  [3,4,5,2],
  [1,3,1,5]
]
Output: 
[
  [0,0,0,0],
  [0,4,5,0],
  [0,3,1,0]
]
Follow up:

A straight forward solution using O(mn) space is probably a bad idea.
A simple improvement uses O(m + n) space, but still not the best solution.
Could you devise a constant space solution?
```

這題主要是在考空間複雜度的部分，因此原本做法和參考做法時間複雜度都是 `O(MxN)` 

但在空間複雜度

* 原本做法: O(M+N)
    * 簡單地用兩個 array 紀錄，哪行 row 或是 col 要改成 0
* 參考做法: O(1)
    * 只要遇到 0 就將 row 和 col 的第一個值，改成 0，最後再判斷只要第一個是 0 就將整行改成 0

# Version 1

原本做法

```ruby
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
```

Runtime: 88 ms

# Version 2

參考做法

```ruby
# @param {Integer[][]} matrix
# @return {Void} Do not return anything, modify matrix in-place instead.
def set_zeroes(matrix)
  is_col = false
  row_len = matrix.length
  col_len = matrix[0].length

  [*0...row_len].each do |row|
    # 用來判斷第一行的 col 有沒有 0，因為過程中會將 row 和 col 的第一個值更改為 0，之後就無法判斷
    is_col = true if matrix[row][0] == 0
    # 接著都從 index 1 開始跑，只要有 0 就將 row 和 col 的第一個值更改為 0
    [*1...col_len].each do |col|
      matrix[row][0] = matrix[0][col] = 0 if matrix[row][col] == 0
    end
  end

  # 接著透過 row 和 col 的第一個值，來判斷是否將整行改為 0
  [*1...row_len].each do |row|
    [*1...col_len].each do |col|
      matrix[row][col] = 0 if matrix[row][0] == 0 || matrix[0][col] == 0
    end
  end

  # 判斷第一個是不是 0，將第一行 row 都改成 0
  if matrix[0][0] == 0
    [*0...col_len].each do |col|
      matrix[0][col] = 0
    end
  end

  # 判斷一開始設定的 is_col 來判斷是否第一行 col 都改成 0
  if is_col
    [*0...row_len].each do |row|
      matrix[row][0] = 0
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
```

Runtime: 88 ms
