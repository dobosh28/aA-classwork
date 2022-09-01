require "byebug"
# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
    def span
        return nil if self.empty?
        return self.max - self.min
    end

    def average
        return nil if self.empty?
        return self.sum / (self.length * 1.0)
    end

    def median
        return nil if self.empty?
        if self.length.odd?
            mid_idx = self.length / 2
            self.sort[mid_idx]
        else
            mid_idx = self.length / 2
            num_1 = self.sort[mid_idx]
            num_2 = self.sort[mid_idx - 1]
            (num_1 + num_2) / 2.0
        end
    end

    def counts
        hash = Hash.new(0)
        self.each { |ele| hash[ele] += 1 }
        hash
    end

    def my_count(num)
        nums = self.select { |n| n == num }
        nums.length
    end

    def my_index(num)
        return nil if !self.include?(num)
        self.each_with_index { |n, i| return i if n == num }
    end

    def my_uniq
        arr = []
        self.each { |ele| arr << ele if !arr.include?(ele) }
        arr
    end

    def my_transpose
        dimensions = self[0].length
        
        new_arr = []
        dimensions.times { new_arr << [] }
        self.each_with_index do |row, row_n|
            row.each_with_index do |ele, col_n|
                new_arr[col_n] << ele
            end
        end
        new_arr
    end

end
