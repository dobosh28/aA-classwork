def partition(arr, num)
    first = []
    second = []

    arr.each do |ele| 
        if ele < num
            first << ele
        else
            second << ele
        end
    end
    [first, second]
end

def merge(hash1, hash2)
    new_hash = {}
    hash1.each { |k, v| new_hash[k] = v }
    hash2.each { |k, v| new_hash[k] = v }
    new_hash
end

def censor(sent, curse_words)
    sent.split(" ").map { |word| curse_words.include?(word.downcase) ? word.gsub(/[AEIOUaeiou]/, "*") : word }.join(" ")
end

def power_of_two?(num)
    i = 1
    while i < num
        i *= 2
    end
    i == num
end