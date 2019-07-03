# @param {Character[]} s
# @return {Void} Do not return anything, modify s in-place instead.
def reverse_string(s)
    tmp = String.new
    size = s.size - 1
    for i in 0..(size/2)
        tmp = s[i]
        s[i], s[size - i] = s[size - i], tmp
    end
    s
end

arr = ["h","e","l","l","o"]
puts reverse_string(arr).inspect

arr = ["H","a","n","n","a","h"]
puts reverse_string(arr).inspect

arr = ["A"," ","m","a","n",","," ","a"," ","p","l","a","n",","," ","a"," ","c","a","n","a","l",":"," ","P","a","n","a","m","a"]
puts reverse_string(arr).inspect
