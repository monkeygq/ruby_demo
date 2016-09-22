# Your goal is to write the solution method, which should return the result of applying the 'modulo 16' operation to any given positive integer.

# Example usage:

# solution(4)  # => 4
# solution(16) # => 0
# solution(18) # => 2
# Note: The following methods (among many others) have been disabled:

# Fixnum#+
# Fixnum#-
# Fixnum#*
# Fixnum#/
# Fixnum#%
# Fixnum#divmod
# Fixnum#fdiv
# Fixnum#modulo
# Fixnum#to_f
# Fixnum#to_s

def solution(n)
  n & 15
end

# use binary's & operation(bitwise AND) is wonderful.
