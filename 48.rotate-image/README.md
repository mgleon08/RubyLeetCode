# 48. Rotate Image

[48. Rotate Image](https://leetcode.com/problems/rotate-image/)

```ruby
You are given an n x n 2D matrix representing an image.

Rotate the image by 90 degrees (clockwise).

Note:

You have to rotate the image in-place, which means you have to modify the input 2D matrix directly. DO NOT allocate another 2D matrix and do the rotation.

Example 1:

Given input matrix = 
[
  [1,2,3],
  [4,5,6],
  [7,8,9]
],

rotate the input matrix in-place such that it becomes:
[
  [7,4,1],
  [8,5,2],
  [9,6,3]
]
Example 2:

Given input matrix =
[
  [ 5, 1, 9,11],
  [ 2, 4, 8,10],
  [13, 3, 6, 7],
  [15,14,12,16]
], 

rotate the input matrix in-place such that it becomes:
[
  [15,13, 2, 5],
  [14, 3, 4, 1],
  [12, 6, 8, 9],
  [16, 7,10,11]
]
```

作法

從最外圍開始，取上面的邊，邊上每個點，在向四個邊輪流交換

```ruby
[
  [1,2,3],
  [4,5,6],
  [7,8,9]
]

to

[
  [7,4,1],
  [8,5,2],
  [9,6,3]
]
```

第一個點

* 1 (0, 0) -> (0, 2)
* 3 (0, 2) -> (2, 2)
* 9 (2, 2) -> (2, 0)
* 7 (2, 0) -> (0, 0)


第二個點

* 2 (0, 1) -> (1, 2)
* 6 (1, 2) -> (2, 1)
* 8 (2, 1) -> (1, 0)
* 4 (1, 0) -> (0, 1)

第三個點，是邊上的最後一個點，因為第一個點在替換時就有包含到了，因此不需要


```ruby
[
  [ 5, 1, 9,11],
  [ 2, 4, 8,10],
  [13, 3, 6, 7],
  [15,14,12,16]
],

to

[
  [15,13, 2, 5],
  [14, 3, 4, 1],
  [12, 6, 8, 9],
  [16, 7,10,11]
]
```


外圈

第一個點
* 5  (0, 0) -> (0, 3)
* 11 (0, 3) -> (3, 3)
* 16 (3, 3) -> (3, 0)
* 15 (3, 0) -> (0, 0)

第二個點
* 1  (0, 1) -> (1, 3)
* 10 (1, 3) -> (3, 2)
* 12 (3, 2) -> (2, 0)
* 13 (2, 0) -> (0, 1)

第三個點

* 9  (0, 2) -> (2, 3)
* 7  (2, 3) -> (3, 1)
* 14 (3, 1) -> (1, 0)
* 2  (1, 0) -> (0, 2)

第四個點，是邊上的最後一個點，因為第一個點在替換時就有包含到了，因此不需要

內圈

第一個點

* 4 (1, 1) -> (1, 2)
* 8 (1, 2) -> (2, 2)
* 6 (2, 2) -> (2, 1)
* 3 (2, 1) -> (1, 1)

第二個點，是邊上的最後一個點，因為第一個點在替換時就有包含到了，因此不需要

根據以上邏輯可得知

* 下一個的 X 會是上一個的 Y
* 下一個 Y 會是 (邊的長度 - 1 - 上一個X)

# Version 1

原本做法

```ruby
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
```

Runtime: 44 ms
