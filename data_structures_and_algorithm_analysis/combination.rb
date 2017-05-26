def combination n
  arr = (1..(2 ** n - 1)).map { |i| "%0#{n}d" % i.to_s(2) }.map(&:reverse)
  arr.each do |i|
    i.chars.each_with_index do |j, index|
      print index + 1 if j == "1"
    end
    puts
  end
end

combination 4

def combination2 arr
  res = []
  arr.each do |i|
    temp = []
    res.each { |j| temp << [i] + j }
    res += temp
    res << [i]
  end
  res
end
p combination2 [1,2,3,4]

def combination3 arr
  if arr.empty?
    return []
  elsif arr.size == 1
    return [arr]
  else
    return combination3(arr[1..-1]) + combination3(arr[1..-1]).map {|i| i << arr[0]} + [[arr[0]]]
  end
end
p combination3 [1,2,3,4]
