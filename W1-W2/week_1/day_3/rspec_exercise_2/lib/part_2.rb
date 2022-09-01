def palindrome?(word)
    reversed = ""

    i = word.length - 1
    while i >= 0
        reversed += word[i]
        i -= 1
    end
    
    reversed == word
end

def substrings(str)
    sub_strs = []
    (0..str.length - 1).each do |i|
        (i..str.length - 1).each do |j|
            sub_strs << str[i..j]
        end
    end
    sub_strs
end

def palindrome_substrings(str)
    sub_strs = substrings(str)
    sub_strs.select { |ele| ele.length > 1 && palindrome?(ele) }
end