# @param {Integer[]} nums
# @return {Void} Do not return anything, modify nums in-place instead.

# Version 1
# def move_zeroes(nums)
#   double_sort_num = nums.sort * 2
#   double_sort_num.each_with_index do |n, index|
#     if n != 0
#       end_index = (double_sort_num.size - (nums.size - index) - 1)
#       return double_sort_num[index..end_index]
#     end
#   end
# end

# Version 2
def move_zeroes(nums)
  number_of_zero = nums.count(0)
  nums.delete(0)
  number_of_zero.times do |zero|
    nums << 0
  end
  nums
end

puts move_zeroes([0, 1, 0, 3, 12])
