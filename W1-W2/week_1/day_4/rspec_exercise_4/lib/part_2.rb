def proper_factors(num)
    (1...num).select { |i| num % i == 0 }
end

def aliquot_sum(num)
    proper_factors(num).sum
end

def perfect_number?(num)
    num == aliquot_sum(num)
end

def ideal_numbers(num)
    ideals = []
    i = 1
    while ideals.length < num
        ideals << i if perfect_number?(i)
        i += 1
    end
    ideals
end