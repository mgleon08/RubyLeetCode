# @param {Integer} n
# @return {Integer}
def fib(n)
  return n if n == 0 || n == 1
  first = 0
  second = 1
  for i in 2..n
    third = first + second
    first = second
    second = third
  end
  third
end

puts fib(0)
puts fib(2)
puts fib(3)
puts fib(4)
