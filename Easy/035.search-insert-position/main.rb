# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}

def search_insert(nums, target)
  nums.each_with_index do |num, index|
    return index if num >= target
  end
  nums.size
end

arr = [1,3,5,6]

puts search_insert(arr, 5)
puts search_insert(arr, 2)
puts search_insert(arr, 7)
puts search_insert(arr, 0)
