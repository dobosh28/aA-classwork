def is_prime?(n)
    return false if n < 2

    (2...n).each { |i| return false if n % i == 0 }

    true
end

def nth_prime(n)
    count = 0

    i = 1
    while true
        count += 1 if is_prime?(i)
        return i if count == n
        i += 1
    end
    
end

def prime_range(min, max)
    (min..max).select { |num| is_prime?(num) }
end