def partition(a, p ,r)
  i = p - 1 # index 0..i are small numbers , others are big numbers
  for j in p..(r-1) # j is a counter
    if a[j] < a[r] # find a small number
      i = i + 1
      a[i], a[j] = a[j], a[i]
    end
  end
  a[i+1], a[r] = a[r], a[i+1]
  return i + 1
end
def quicksort(a, p ,r)
  if p < r
    q = partition(a, p ,r)
    quicksort(a, p, q-1)
    quicksort(a, q+1, r)
  end
end

a = [3,5,9,7,4,2,8,7]
quicksort(a, 0, 7)
p a #=> [2, 3, 4, 5, 7, 7, 8, 9]
