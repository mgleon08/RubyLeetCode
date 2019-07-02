# @param {Integer} n
# @return {String[]}
def fizz_buzz(n)
  result = []
  for i in 1..n
      text = String.new
      text << "Fizz" if i % 3 == 0
      text << "Buzz" if i % 5 == 0
      result << (text.empty? ? i.to_s : text)
  end
  result
end

puts fizz_buzz(30)
