def first_anagram?(str1, str2) #o(n!)
    grams = str1.split("").permutation.to_a #n!
    joined = grams.map { |gram| gram.join("") } #? 
    
    return joined.include?(str2) #c
end

def second_anagram?(str1, str2)
    
    str1.each_char do |char|
        idx = str2.index(char)
       
        str2 = str2.delete(str2[idx]) if str2.include?(char)
        
    end
   if str2.empty?
    return true 
   end
   false
  
end

