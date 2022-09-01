def hipsterfy(word)
    vowels = "aeiou"
    i = word.length - 1
    while i >= 0
        char = word[i]

        if vowels.include?(char)
            return word[0...i] + word[i + 1..-1]
        end

        i -= 1
    end
    word
end

def vowel_counts(str)
    hash = Hash.new(0)
    vowels = "aeiou"
    str.downcase.each_char { |char| hash[char] += 1 if vowels.include?(char)}
    hash
end

def caesar_cipher(str, n)
    alphabet = ("a".."z").to_a
    new_str = ""
    str.each_char do |char|
        if alphabet.include?(char)
            old_idx = alphabet.index(char)
            new_idx = old_idx + n
            new_char = alphabet[new_idx % 26]
            new_str += new_char
        else
            new_str += char
        end
    end
    new_str
end