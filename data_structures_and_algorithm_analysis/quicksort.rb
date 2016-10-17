def quicksort(a)
  x = a.pop
  x.nil? ? [] : quicksort(a.select { |i| i <= x }) + [x] + quicksort(a.select { |i| i > x })
end

a = [3,45,6,7,34,14,62,5,6,7,9,1,3,4,45,36]
p quicksort a   #=> [1, 3, 3, 4, 5, 6, 6, 7, 7, 9, 14, 34, 36, 45, 45, 62]

def quicksort2(b)
  x = b.pop
  x.nil? ? [] : quicksort2(b.select { |i| i >= x }) + [x] + quicksort2(b.select { |i| i < x })
end
b = [3,45,6,7,34,14,62,5,6,7,9,1,3,4,45,36]
p quicksort2 b  #=> [62, 45, 45, 36, 34, 14, 9, 7, 7, 6, 6, 5, 4, 3, 3, 1]
 
# [1, 3, 3, 4, 5, 6, 6, 7, 7, 9, 14, 34, 36, 45, 45, 62] 
# [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16]

def firstk(a, k)
  x = a.pop
  small = a.select { |i| i <= x } 
  big =a.select { |i| i > x } 
  if k == small.size + 1
    return x
  else
    k <= small.size ? firstk(small, k) : firstk(big, k - small.size - 1)
  end 
end

c = [3,45,6,7,34,14,62,5,6,7,9,1,3,4,45,36]
p firstk c, 10  #=> 9
