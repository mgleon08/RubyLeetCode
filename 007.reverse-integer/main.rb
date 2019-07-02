# @param {Integer} x
# @return {Integer}
def reverse(x)
  max = 2**31 - 1
  min = -2**31

  # can use x.negative?
  neg = x < 0
  x *= -1 if neg

  rev = 0
  while x != 0
    # 取出最後一位
    pop = x % 10
    x /= 10
    # 將取出的放到另一個變數
    rev = rev * 10 + pop
  end

  return 0 if rev < min || max < rev

  neg ? rev * -1 : rev
end

puts reverse(123)
puts reverse(-123)
puts reverse(120)
