# @param {Integer[]} a
# @return {Integer}
def peak_index_in_mountain_array(a)
  i = 0
  while a[i+1] > a[i]
    i+=1
  end
  i
end


nums = [0,1,0]
puts peak_index_in_mountain_array(nums)
nums = [0,1,2,0]
puts peak_index_in_mountain_array(nums)
