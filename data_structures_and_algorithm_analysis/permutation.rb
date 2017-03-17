def permutation(arr)
  if arr.size == 1
    return [arr]
  else
    res = []
    arr.each do |i|
      permutation(arr - [i]).each do |j|
        res << [i] + j
      end
    end
    res
  end
end

p permutation([1,2,3,4])
