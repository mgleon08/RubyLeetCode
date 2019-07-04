# @param {Integer[]} nums
# @return {Integer}
def majority_element(nums)
  nums.sort[nums.size/2]
end

puts majority_element([3,2,3])
puts majority_element([2,2,1,1,1,2,2])
