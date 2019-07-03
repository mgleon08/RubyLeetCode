# @param {Integer[]} nums
# @return {Integer}
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

puts single_number([2,2,1])
puts single_number([4,1,2,1,2])
