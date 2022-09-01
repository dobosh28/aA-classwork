require "byebug"

def my_min_1(arr) # o(n ^2)
   sorted = false # c
   while !sorted # n
        sorted = true # c

        (0...arr.length - 1).each do |i| #n
            if arr[i] > arr[i + 1] # c
                arr[i], arr[i + 1] = arr[i + 1], arr[i] #c
                sorted = false #c
            end
        end
    end
    return arr[0] #c
end

def my_min_2(arr) # o(n)
    min = arr[0] # c

    arr.each do |num| #n
        min = num if min > num # c
    end

    min #c
end

def largest_contiguous_sub_sum_1(arr) #n^2
    subarrs = []

    (0..arr.length - 1).each do |i| #n
        (i..arr.length - 1).each do |j| #n
            subarrs << arr[i..j] #n
        end
    end

    sums = subarrs.map { |subarr| subarr.sum }
    sums.max
end

list_1 = [5, 3, -7]
list_2 = [2, 3, -6, 7, -6, 7]
list_3 = [-5, -1, -3]

def largest_contiguous_sub_sum_2(arr) #O(n)
    max = arr.first
    current = arr.first

    arr.drop(1).each do |num|
    
        if current < 0
            current = 0
        end

        current += num

        if current > max
            max = current
        end
    end

    max
end

p largest_contiguous_sub_sum_2(list_2)