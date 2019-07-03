# @param {Integer} n
# @return {Integer}

# Version 1
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

# Version 2
# def fib(n)
#   a, b = 0, 1
#   n.times { a, b = b, a + b }
#   a
# end

puts fib(0)
puts fib(2)
puts fib(3)
puts fib(4)
