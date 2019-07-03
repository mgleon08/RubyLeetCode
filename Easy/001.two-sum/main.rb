# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}

def two_sum(nums, target)
  # 建立一個字典
  dict = Hash.new
  nums.each_with_index do |num, index|
    # 每次都檢查字典又沒有剩下的字，如果有代表之前有數字符合
    if dict[target - num]
      return dict[target - num], index
    end
    # 沒有就建立在字典，以便後續查找
    dict[num] = index
  end
end

nums = [2, 7, 11, 15]
target = 9
puts two_sum(nums, target)
