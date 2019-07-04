# @param {Integer[]} nums
# @return {Boolean}
def contains_duplicate(nums)
  nums.size != nums.uniq.size
end

# def contains_duplicate(nums)
#   map = {}
#   nums.each do |num|
#     if map[num]
#        return true
#     else
#       map[num] = true
#     end
#   end

#   return false
# end

puts contains_duplicate([1,2,3,1])
puts contains_duplicate([1,2,3,4])
puts contains_duplicate([1,1,1,3,3,4,3,2,4,2])
