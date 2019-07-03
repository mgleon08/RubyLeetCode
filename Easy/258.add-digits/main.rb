# @param {Integer} num
# @return {Integer}
def add_digits(num)
  while num / 10 != 0
    num = (num / 10) + (num % 10)
  end
  num
end

puts add_digits(38)
