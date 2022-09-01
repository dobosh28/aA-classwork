def my_map!(arr, &prc)
    arr = (0..arr.length - 1).each { |i| arr[i] = prc.call(arr[i])}
end

def two?(arr, &prc)
    arr.count { |ele| prc.call(ele) } == 2
end

def nor_select(arr, prc_1, prc_2)
    arr.select { |ele| !prc_1.call(ele) && !prc_2.call(ele) }
end

def array_of_hash_sum(hashes)
    sum = 0
    hashes.each { |hash| hash.each { |k, v| sum += hash[k] } }
    sum
end

def remove_vowel(word)
    vowels = "aeiou"
    i = 0
    while i < word.length 
        char = word[i]

        if vowels.include?(char)
            return word[0...i] + word[i + 1..-1]
        end

        i += 1
    end
    word
end

def slangify(sent)
    words = sent.split(" ")
    words.map { |word| remove_vowel(word) }.join(" ")
end

def char_counter(str, *chars)
    str_hash = Hash.new(0)
    str.each_char { |char| str_hash[char] += 1 }
    return str_hash if chars.length == 0

    chars_counter = {}
    chars.each { |char| chars_counter[char] = str_hash[char] }
    chars_counter
end

