# @param {Integer[]} a
# @return {Boolean}

def valid_mountain_array(a)
  n = a.size
  i = 0
  j = n - 1

  # 從左邊算出山頭
  while (i + 1 < n && a[i] < a[i + 1])
    i+=1
  end

  # 從右邊算出山頭
  while (j > 0 && a[j - 1] > a[j])
    j-=1
  end

  # 判斷山頭一定要在中間，不會在頭尾，並且左右兩邊算過來的山頭會是一樣
  i > 0 && i == j && i < n-1
end

nums = [2,1]
puts valid_mountain_array(nums)
nums = [3,5,5]
puts valid_mountain_array(nums)
nums = [0,3,2,1]
puts valid_mountain_array(nums)
