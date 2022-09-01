def zip(*arrs)
    length = arrs.first.length #3
    (0...length).map do |i| 
        arrs.map { |arr| arr[i]} 
    end
end

def prizz_proc(arr, prc_1, prc_2)
    arr.select { |ele| ((prc_1.call(ele) && !prc_2.call(ele)) || (prc_2.call(ele) && !prc_1.call(ele))) }
end

def zany_zip(*arrs)

end

def maximum(arr, &prc)
    return nil if arr.length == 0
    max = arr.first
    arr.each do |ele|
        max = ele if prc.call(ele) >= prc.call(max)
    end
    max
end

def my_group_by(arr, &prc)
    result = Hash.new { |hash, key| hash[key] = [] }
    arr.each do |ele|
        key = prc.call(ele)
        result[key] << ele
    end
    result
end

def max_tie_breaker(arr, prc, &blk)
    return nil if arr.length == 0
    max = arr.first 
    arr.each do |ele|
        ele_result = blk.call(ele)
        max_result = blk.call(max)
        if ele_result > max_result
            max = ele
        elsif ele_result == max_result && prc.call(ele) > prc.call(max)
            max = ele
        end
    end
    max
end

def vowel_indices(word)
    vowels = 'aeiou'
    indices = []
    word.each_char.with_index do |char, i|
        indices << i if vowels.include?(char)
    end
    indices
end

def edit_word(word)
    indices = vowel_indices(word)
    word[indices.first..indices.last]
end

def silly_syllables(sent)
    words = sent.split(" ")
    new_words = words.map do |word|
        num_vowels = vowel_indices(word).length
        if num_vowels < 2
            word
        else
            edit_word(word)
        end
    end
    new_words.join(" ")
end