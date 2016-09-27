# A friend of mine takes a sequence of numbers from 1 to n (where n > 0).
# Within that sequence, he chooses two numbers, a and b.
# He says that the product of a and b should be equal to the sum of all numbers in the sequence, excluding a and b.
# Given a number n, could you tell me the numbers he excluded from the sequence?
# The function takes the parameter: n (don't worry, n is always strictly greater than 0 and small enough so we shouldn't have overflow) and returns an array of the form:

# [(a, b), ...] or [[a, b], ...] or {{a, b}, ...} or or [{a, b}, ...]
# with all (a, b) which are the possible removed numbers in the sequence 1 to n.

# [(a, b), ...] or [[a, b], ...] or {{a, b}, ...} or ...will be sorted in increasing order of the "a".

# It happens that there are several possible (a, b). The function returns an empty array if no possible numbers are found which will prove that my friend has not told the truth!

# Examples:

# removNb(26) should return [(15, 21), (21, 15)]
# removNb(100) should return []

#========================================================================================================>
#
# combination is not a good solution, O(n ** 2) 
# below is O(n)
# a * b = sum(n) - a - b
# a = sum(n) - b / b + 1
# then determine a's scope
# when b = n , a is min , so a >= sum(n) - n / n + 1
# when b = a , a is max , so a <= sqrt(sum(n) + 1) - 1
# then sum(n) - n / n + 1 <= a <= sqrt(sum(n) + 1) - 1
# so, b is calculated also (a and b must to_i)
# if a * b + a + b = sum(n)
# [a,b] and [b,a] are results
# finally sort
#
#========================================================================================================>



def removNb(n) 
  res = []
  sum = n * (n + 1) / 2
  low = (sum - n) / (n + 1)
  up = Math.sqrt(sum + 1) - 1
  (low.to_i..up.to_i).each do |a|
    b = (sum - a) / (a + 1)
    if a * b + a + b == sum
      res << [a, b]
      res << [b, a]
    end
  end
  res.sort_by { |arr| arr.first }
end
