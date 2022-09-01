def element_count(arr)
    hash = Hash.new(0)
    arr.each { |ele| hash[ele] += 1 }
    hash
end

def char_replace!(str, hash)
    str.each_char.with_index { |char, i| hash.has_key?(char) ? str[i] = hash[char] : str[i] = char }
end

def product_inject(nums)
    nums.inject { |product, multiplier| product * multiplier }
end