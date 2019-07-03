# Ruby LeetCode

Use ruby to solve leetcode

* [leetcode](https://leetcode.com/)

## Time complexity 時間複雜度

一個程式的時間複雜度是指完全地執行程式所需的計算機時間

* [Time Complexity](https://en.wikipedia.org/wiki/Time_complexity)

![](http://www.regor.url.tw/cnchou/wp-content/uploads/2016/03/tractabletimecomplexity-1.jpg)

### O(1)：陣列讀取

```ruby
arr = [9, 11, 17, 43, 61, 65, 76, 84, 88, 99]
arr[7]
# 84
```

### O(n)：簡易搜尋

```ruby
arr = [9, 11, 17, 43, 61, 65, 76, 84, 88, 99]
arr.each_with_index do |number, index|
  if number == 84
    puts "#{index+1}. Find index #{index} is number #{number}" 
    break
  else
    puts "#{index+1}. index #{index} is number #{number}" 
  end
end

# 1. index 0 is number 9
# 2. index 1 is number 11
# 3. index 2 is number 17
# 4. index 3 is number 43
# 5. index 4 is number 61
# 6. index 5 is number 65
# 7. index 6 is number 76
# 8. Find index 7 is number 84
```

### O(log n)：二分搜尋

```ruby
def binary_search(arr, find)
  left = 0
  right = arr.length - 1
  n = 1

  while left <= right
  	mid = (left + right) / 2
    if arr[mid] > find
      right = mid - 1
      puts "#{n}. index #{mid} is number #{arr[mid]}"
    elsif arr[mid] < find
      left = mid + 1
      puts "#{n}. index #{mid} is number #{arr[mid]}"
    else
      puts "#{n}. Find index #{mid} is number #{arr[mid]}"
      break
    end
    n += 1
  end
  puts "Not found number #{find}." if left > right
end

arr = [9, 11, 17, 43, 61, 65, 76, 84, 88, 99]
binary_search(arr, 84)

# 1. index 4 is number 61
# 2. Find index 7 is number 84
```

### O(n²)：選擇排序法(Selection Sort)、插入排序法(Insertion Sort)

##### 選擇排序法(Selection Sort)

```ruby
def selection_sort(numbers)
  [*0...numbers.size].each do |index1|
    min_index = index1
    [*(index1+1)...numbers.size].each do |index2|
      min_index = index2 if numbers[index2] < numbers[min_index]
    end
    numbers[index1], numbers[min_index] = numbers[min_index], numbers[index1]
  end
  numbers
end

numbers = [41, 33, 17, 80, 61, 5, 55]
puts selection_sort(numbers)

# [5 17 33 41 55 61 80]
```

##### 插入排序法(Insertion Sort)

```ruby
def insertion_sort(numbers)
  [*0...numbers.size].each do |index|
    tmp = numbers[index]
    while index > 0 && numbers[index - 1] > tmp
      numbers[index] = numbers[index-1]
      index-=1
    end
    numbers[index] = tmp
  end
  numbers
end

numbers = [41, 33, 17, 80, 61, 5, 55]
puts insertion_sort(numbers)

# [5 17 33 41 55 61 80]
```

### O(n logn)：合併排序 (Merge Sort)

### O(2^n)：費波那契數列 (Fibonacci numbers)

```ruby
def fibo(n)
  if n == 0
    0
  elsif n == 1
    1
  else
    fibo(n-1) + fibo(n-2)
  end
end

puts fibo(10)
# 55
```
空間換取時間 O(n)

```ruby
def fibo(n)
  arr, arr[0], arr[1] = [], 0, 1
  [*2..n].each do |i|
    arr[2] = arr[0] + arr[1]
    arr[0] = arr[1]
    arr[1] = arr[2]
  end
  arr[2]
end

puts fibo(10)
# 55
```

## Learning

* [初學者學演算法｜談什麼是演算法和時間複雜度](https://medium.com/appworks-school/%E5%88%9D%E5%AD%B8%E8%80%85%E5%AD%B8%E6%BC%94%E7%AE%97%E6%B3%95-%E8%AB%87%E4%BB%80%E9%BA%BC%E6%98%AF%E6%BC%94%E7%AE%97%E6%B3%95%E5%92%8C%E6%99%82%E9%96%93%E8%A4%87%E9%9B%9C%E5%BA%A6-b1f6908e4b80)
* [初學者學演算法｜從時間複雜度認識常見演算法（一）](https://medium.com/appworks-school/%E5%88%9D%E5%AD%B8%E8%80%85%E5%AD%B8%E6%BC%94%E7%AE%97%E6%B3%95-%E5%BE%9E%E6%99%82%E9%96%93%E8%A4%87%E9%9B%9C%E5%BA%A6%E8%AA%8D%E8%AD%98%E5%B8%B8%E8%A6%8B%E6%BC%94%E7%AE%97%E6%B3%95-%E4%B8%80-b46fece65ba5)
* [初學者學演算法｜排序法入門：選擇排序與插入排序法](https://medium.com/appworks-school/%E5%88%9D%E5%AD%B8%E8%80%85%E5%AD%B8%E6%BC%94%E7%AE%97%E6%B3%95-%E6%8E%92%E5%BA%8F%E6%B3%95%E5%85%A5%E9%96%80-%E9%81%B8%E6%93%87%E6%8E%92%E5%BA%8F%E8%88%87%E6%8F%92%E5%85%A5%E6%8E%92%E5%BA%8F%E6%B3%95-23d4bc7085ff)
* [初學者學演算法｜排序法進階：合併排序法](https://medium.com/appworks-school/%E5%88%9D%E5%AD%B8%E8%80%85%E5%AD%B8%E6%BC%94%E7%AE%97%E6%B3%95-%E6%8E%92%E5%BA%8F%E6%B3%95%E9%80%B2%E9%9A%8E-%E5%90%88%E4%BD%B5%E6%8E%92%E5%BA%8F%E6%B3%95-6252651c6f7e)
* [初學者學演算法｜從費氏數列認識何謂遞迴](https://medium.com/appworks-school/%E5%88%9D%E5%AD%B8%E8%80%85%E5%AD%B8%E6%BC%94%E7%AE%97%E6%B3%95-%E5%BE%9E%E8%B2%BB%E6%B0%8F%E6%95%B8%E5%88%97%E8%AA%8D%E8%AD%98%E4%BD%95%E8%AC%82%E9%81%9E%E8%BF%B4-dea15d2808a3)
