def reverser(str, &prc)
    prc.call(str.reverse)
end

def word_changer(sent, &prc)
    sent.split(" ").map { |word| prc.call(word) }.join(" ")
end

def greater_proc_value(n, prc_1, prc_2)
    if prc_1.call(n) > prc_2.call(n)
        prc_1.call(n)
    else
        prc_2.call(n)
    end
end

def and_selector(arr, prc_1, prc_2)
    arr.select { |ele| prc_1.call(ele) && prc_2.call(ele) }
end

def alternating_mapper(arr, prc_1, prc_2)
    arr.map.with_index do |ele, i|  
        if i.even?
            prc_1.call(ele)
        else
            prc_2.call(ele)
        end
    end
end