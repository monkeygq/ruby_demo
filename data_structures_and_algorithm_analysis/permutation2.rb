def permutation(num)
  str = init(num)
  p str
  arrow = Hash.new(0) # 0 is left, 1 is right
  while(index_arr = find_and_change_arrow(str, num, arrow))
    str = change(str, index_arr)
    p str
  end
end

def init(num)
  (1..num).inject("") { |str, n| str << n.to_s }
end

def find_and_change_arrow(str, num, arrow)
  (1..num).reverse_each do |n|
    index = str.index(n.to_s)
    if arrow[n.to_s] == 0
      if index > 0 && str[index] > str[index - 1]
        ((n+1)..num).each { |i| toggle_arrow(arrow, i) } 
        return [index - 1, index] 
      end
    else
      if (index < str.length - 1) && (str[index] > str[index + 1])
        ((n+1)..num).each { |i| toggle_arrow(arrow, i) }
        return [index, index + 1] 
      end
    end
  end
  return nil
end

def change(str, index_arr)
  str[index_arr[0]], str[index_arr[1]] = str[index_arr[1]], str[index_arr[0]]
  str
end

def toggle_arrow(arrow, i)
  arrow[i.to_s] = (arrow[i.to_s] == 1 ? 0 : 1)
end

permutation 5

# algorithm url
# http://www.cnblogs.com/1-2-3/archive/2011/05/23/generate-permutation-part3.html
