def average(n1, n2)
    (n1 + n2) / 2.0
end

def average_array(arr)
    (arr.sum * 1.0) / arr.length
end

def repeat(str, n)
    str * n
end

def yell(str)
    str.upcase + "!"
end

def alternating_case(sent)
    words = sent.split(" ")
    (0..words.length - 1).map do |i|
        if i % 2 == 0
            words[i].upcase
        else
            words[i].downcase
        end
    end.join(" ")
end

