def first_letter_vowel_count(str)
    vowels = "AEIOUaeiou"
    str.split(" ").count { |word| vowels.include?(word[0]) }
end

def count_true(arr, prc)
    arr.count { |ele| prc.call(ele) }
end

def procformation(arr, prc_1, prc_2, prc_3)
    arr.map do |ele|
        if prc_1.call(ele)
            prc_2.call(ele)
        else
            prc_3.call(ele)
        end
    end
end

def array_of_array_sum(arr)
    arr.flatten.sum
end

def selective_reverse(str)
    vowels = "aeiou"
    new_words = []
    str.split(" ").each do |word|
        if vowels.include?(word[0].downcase && word[-1].downcase) 
            new_words << word
        else
            new_words << word.reverse
        end
    end
    new_words.join(" ")
end

def hash_missing_keys(hash, *args)
    new_arr = []
    return new_arr if args.length == 0
    args.each { |ele| new_arr << ele unless hash.key?(ele) }
    new_arr
end