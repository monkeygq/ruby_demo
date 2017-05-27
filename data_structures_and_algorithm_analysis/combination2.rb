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

combination(8,4).each {|i| p i }

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

combination2(4, 2)








