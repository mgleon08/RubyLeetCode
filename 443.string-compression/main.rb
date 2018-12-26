# @param {Character[]} chars
# @return {Integer}

def compress(chars)
  # 透過 mark 去註記每次記錄到哪個 index
  mark, counts = 0, 1
  [*0...chars.size].each do |i|
    if  i+1 != chars.size && chars[i] == chars[i+1]
      counts += 1
    else
      chars[mark] = chars[i]
      mark += 1
      if counts > 1
        # 將 counts 轉成 string 在個別塞到原本的 array 裡 e.g. 12 -> 1, 2
        counts.to_s.chars.each do |count|
          chars[mark] = count
          mark += 1
        end
        counts = 1
      end
    end
  end
  # 最後只截取到 mark 的長度
  chars[0...mark].size
end

puts compress(["a","a","b","b","c","c","c"])
puts compress(["a"])
puts compress(["a","b","b","b","b","b","b","b","b","b","b","b","b"])
