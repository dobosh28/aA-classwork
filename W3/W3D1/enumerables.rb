# created file
# hello
# my example comment

class Array

    def my_each(&prc)
        
        i = 0

        while i <= self.length-1
           prc.call(self[i])
            i += 1
        end

       return self
    end

    def my_select(&prc)
        new_arr = []
        self.my_each do |ele| 
            if prc.call(ele)
                new_arr << ele
            end
        end
        return new_arr 
    end

    def my_reject(&prc)
        new_arr = []

        self.my_each do |ele|
            if !prc.call(ele)
                new_arr << ele
            end
        end

        new_arr
    end

    def my_any?(&prc)
        self.my_each do |ele|
            return true if prc.call(ele)
        end
        false
    end

    def my_all?(&prc)
        self.my_each do |ele|
            return false if !prc.call(ele)
        end
        true
    end

    def my_flatten
        flattened = []

        self.my_each do |ele| 
            if !ele.kind_of?(Array)
                flattened << ele
            else
                flattened += ele.my_flatten
            end
        end

        flattened
    end

end




# p return_value = [1, 2, 3].my_each { |num| puts num }.my_each { |num| puts num }
# p return_value = [1, 2, 3].my_each { |num| puts num }


# a = [1, 2, 3]
# p a.my_select { |num| num > 1 } # => [2, 3]
# p a.my_select { |num| num == 4 } # => []
# p a.my_reject { |num| num > 1 } # => [1]
# p a.my_reject { |num| num == 4 } # => [1, 2, 3]
# p a.my_any? { |num| num > 1 } # => true
# p a.my_any? { |num| num == 4 } # => false
# p a.my_all? { |num| num > 1 } # => false
# p a.my_all? { |num| num < 4 } # => true
# [1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten # => [1, 2, 3, 4, 5, 6, 7, 8]
