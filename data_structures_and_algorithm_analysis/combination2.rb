def combination(n, k)
  if k == 1
    (1..n).map { |i| [i] }
  elsif n < k || n <= 0 || k <= 0
    []
  else
    res = []
    (k..n).each do |j|
      combination(j-1, k-1).each { |k| res << k + [j] }
    end
    res
  end
end

p combination(5, 3)

def combination2(n, k)
  res = []
  (1..k).each do |i|
    if res.empty?
      (1..n).each { |j| res << [j] }
    else
      res1 = []
      res.each do |k|
        ((k.last + 1)..n).each { |m| res1 << k + [m]}
      end
      res = res1
    end
  end
  res
end

p combination2(5, 3)

def combination3(n, start, k)
  if k == 1
    (start..n).map { |i| [i] }
  else 
    res = []
    (start..(n-k+1)).each do |j|
      combination3(n, j+1, k-1 ).each { |k| res << [j] + k }
    end
    res
  end
end
p combination3(5,1,3)






