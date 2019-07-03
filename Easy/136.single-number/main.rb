# @param {Integer[]} nums
# @return {Integer}

# Version 1
def single_number(nums)
  count = 0
  nums_sort = nums.sort
  nums_sort.each_with_index do |num, index|
    if nums_sort[index + 1] == num
      count += 1
    else
     return num if count == 0
     count = 0
    end
  end
end

# Version 2
# def single_number(nums)
#   hash = Hash.new(0)
#   nums.each do |num|
#       hash[num]+=1
#   end
#   hash.key(1)
# end

# Version 3
# `^` is `XOR`

# ruby will use binary like

# - [4,1,2,1,2] = [100, 001, 010, 001, 010]
# - 100 ^ 001 = 101
# - 101 ^ 010 = 111
# - 111 ^ 001 = 110
# - 110 ^ 010 = 100 = 4
# def single_number(nums)
#   nums.inject(&:^)
# end

puts single_number([2,2,1])
puts single_number([4,1,2,1,2])
