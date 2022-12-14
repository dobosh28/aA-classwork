require "byebug"
# strange_sums
# Write a method strange_sums that accepts an array of numbers as an argument. 
# The method should return a count of the number of distinct pairs of elements that have a sum of zero. 
# You may assume that the input array contains unique elements.

def strange_sums(nums)
    count = 0
    
    nums.length.times do |i|
        (i..nums.length - 1).each do |j|
            num1 = nums[i]
            num2 = nums[j]
            count += 1 if num1 + num2 == 0
        end
    end
    
    count
end

p strange_sums([2, -3, 3, 4, -2])     # 2
p strange_sums([42, 3, -1, -42])      # 1
p strange_sums([-5, 5])               # 1
p strange_sums([19, 6, -3, -20])      # 0
p strange_sums([9])                   # 0




# pair_product
# Write a method pair_product that accepts an array of numbers and a product as arguments. 
# The method should return a boolean indicating whether or not a pair of distinct elements 
# in the array result in the product when multiplied together. 
# You may assume that the input array contains unique elements.
p "--------------------"

def pair_product(nums, prod)

    nums.length.times do |i|
        (i + 1..nums.length - 1).each do |j|
            num1 = nums[i]
            num2 = nums[j]
            return true  if num1 * num2 == prod
        end
    end 
    false
end

p pair_product([4, 2, 5, 8], 16)    # true
p pair_product([8, 1, 9, 3], 8)     # true
p pair_product([3, 4], 12)          # true
p pair_product([3, 4, 6, 2, 5], 12) # true
p pair_product([4, 2, 5, 7], 16)    # false
p pair_product([8, 4, 9, 3], 8)     # false
p pair_product([3], 12)             # false




# rampant_repeats
# Write a method rampant_repeats that accepts a string and a hash as arguments. 
# The method should return a new string where characters of the original string are repeated the number of times specified by the hash. 
# If a character does not exist as a key of the hash, then it should remain unchanged.
p "--------------------"

def rampant_repeats(str, hash)
    new_str = ""
    str.each_char do |char|
        if hash.has_key?(char)
            new_str += char * hash[char]
        else
            new_str += char
        end
    end
    new_str
end

p rampant_repeats('taco', {'a'=>3, 'c'=>2})             # 'taaacco'
p rampant_repeats('feverish', {'e'=>2, 'f'=>4, 's'=>3}) # 'ffffeeveerisssh'
p rampant_repeats('misispi', {'s'=>2, 'p'=>2})          # 'mississppi'
p rampant_repeats('faarm', {'e'=>3, 'a'=>2})            # 'faaaarm'




# perfect_square?
# Write a method perfect_square? that accepts a number as an argument. 
# The method should return a boolean indicating whether or not the argument is a perfect square. 
# A perfect square is a number that is the product of some number multiplied by itself. 
# For example, since 64 = 8 * 8 and 144 = 12 * 12, 64 and 144 are perfect squares; 35 is not a perfect square.
p "--------------------"

def perfect_square?(num)
    Math.sqrt(num) % 1 == 0
end

p perfect_square?(1)     # true
p perfect_square?(4)     # true
p perfect_square?(64)    # true
p perfect_square?(100)   # true
p perfect_square?(169)   # true
p perfect_square?(2)     # false
p perfect_square?(40)    # false
p perfect_square?(32)    # false
p perfect_square?(50)    # false




# anti_prime?
# Write a method anti_prime? that accepts a number as an argument. 
# The method should return true if the given number has more divisors than all positive numbers less than the given number. 
# For example, 24 is an anti-prime because it has more divisors than any positive number less than 24. 
# Math Fact: Numbers that meet this criteria are also known as highly composite numbers.
p "--------------------"

def num_factors(num)
    (1..num).count { |i| num % i == 0}
end

def anti_prime?(num)
    factors_amount = num_factors(num)
    (1...num).all? { |i| factors_amount > num_factors(i) }
end

p anti_prime?(24)   # true
p anti_prime?(36)   # true
p anti_prime?(48)   # true
p anti_prime?(360)  # true
p anti_prime?(1260) # true
p anti_prime?(27)   # false
p anti_prime?(5)    # false
p anti_prime?(100)  # false
p anti_prime?(136)  # false
p anti_prime?(1024) # false
p "--------------------"




# matrix_addition
# Let a 2-dimensional array be known as a "matrix". 
# Write a method matrix_addition that accepts two matrices as arguments. 
# The two matrices are guaranteed to have the same "height" and "width". 
# The method should return a new matrix representing the sum of the two arguments. 
# To add matrices, we simply add the values at the same positions:

# programmatically
# [[2, 5], [4, 7]] + [[9, 1], [3, 0]] => [[11, 6], [7, 7]]

# structurally
# 2 5  +  9 1  =>  11 6
# 4 7     3 0      7 7
p "--------------------"

def matrix_addition(m1, m2)
    height = m1.length
    width = m1[0].length
    result = Array.new(height) { [0] * width }

    (0...height).each do |row|
        (0...width).each do |col|
            result[row][col] = m1[row][col] + m2[row][col]
        end
    end
    result
end


matrix_a = [
    [2,5], 
    [4,7]
]

matrix_b = [
    [9,1], 
    [3,0]
]


matrix_c = [[-1,0], [0,-1]]
matrix_d = [[2, -5], [7, 10], [0, 1]]
matrix_e = [[0 , 0], [12, 4], [6,  3]]

p matrix_addition(matrix_a, matrix_b) # [[11, 6], [7, 7]]
p matrix_addition(matrix_a, matrix_c) # [[1, 5], [4, 6]]
p matrix_addition(matrix_b, matrix_c) # [[8, 1], [3, -1]]
p matrix_addition(matrix_d, matrix_e) # [[2, -5], [19, 14], [6, 4]]




# mutual_factors
# Write a method mutual_factors that accepts any amount of numbers as arguments. 
# The method should return an array containing all of the common divisors shared among the arguments. 
# For example, the common divisors of 50 and 30 are [1, 2, 5, 10]. 
# You can assume that all of the arguments are positive integers.
p "--------------------"

def factors(num)
    (1..num).select { |i| num % i == 0}
end

def mutual_factors(*nums)
    minimum = nums.min
    (1..minimum).select do |n| 
        nums.all? { |num| factors(num).include?(n)}
    end
end

p mutual_factors(50, 30)            # [1, 2, 5, 10]
p mutual_factors(50, 30, 45, 105)   # [1, 5]
p mutual_factors(8, 4)              # [1, 2, 4]
p mutual_factors(8, 4, 10)          # [1, 2]
p mutual_factors(12, 24)            # [1, 2, 3, 4, 6, 12]
p mutual_factors(12, 24, 64)        # [1, 2, 4]
p mutual_factors(22, 44)            # [1, 2, 11, 22]
p mutual_factors(22, 44, 11)        # [1, 11]
p mutual_factors(7)                 # [1, 7]
p mutual_factors(7, 9)              # [1]




# tribonacci_number
# The tribonacci sequence is similar to that of Fibonacci. 
# The first three numbers of the tribonacci sequence are 1, 1, and 2. 
# To generate the next number of the sequence, we take the sum of the previous three numbers. 
# The first six numbers of tribonacci sequence are:
# 1, 1, 2, 4, 7, 13, ... and so on
# Write a method tribonacci_number that accepts a number argument, n, and returns the n-th number of the tribonacci sequence.
p "--------------------"

def tribonacci_number(n)
    return 1 if n == 1 || n == 2
    return 2 if n == 3
    tribonacci_number(n - 3) + tribonacci_number(n - 2) + tribonacci_number(n - 1)
end

p tribonacci_number(1)  # 1
p tribonacci_number(2)  # 1
p tribonacci_number(3)  # 2
p tribonacci_number(4)  # 4
p tribonacci_number(5)  # 7
p tribonacci_number(6)  # 13
p tribonacci_number(7)  # 24
p tribonacci_number(11) # 274