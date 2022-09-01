def my_uniq(array)
    new_arr = []
    
    array.each do |el|
        new_arr << el if !new_arr.include?(el) 
    end

    new_arr

end

def two_sum(array)
    pairs = []

    (0...array.length).each do |i|
        (i + 1...array.length).each do |j|
            pairs << [i, j] if array[i] + array[j] == 0
        end
    end

    pairs
end



def my_transpose(subarrays)
    dimensions = subarrays[0].length
    transposed = []

    dimensions.times { transposed << [] }
    subarrays.each_with_index do |row, row_n|
        row.each_with_index do |el, col_n|
            transposed[col_n] << el
        end
    end

    transposed
end

# def stock_picker(*prices)
#     largest_diff = Hash.new { |h,k| h[k] = v }

#     (0...prices.length) do |buy_day| #indices
#         (buy_day + 1...prices.length) do |after_day|  #indices
#             price_diff = prices[after_day] - prices[buy_day]
#             largest_diff[buy_day, after_day] = price_diff
#         end
#     end

#     largest_diff.select { |days| price_diff.max }
# end


# def stock_picker(array) # Day 1, day 4 with value $5 
#     largest_diff = Hash.new { |h,k| h[k] = v }

#     (0...array.length).each do |buy_day| #indices
#         (buy_day + 1...array.length).each do |after_day|  #indices
#             price_diff = array[after_day] - array[buy_day]
#             largest_diff[buy_day, after_day] = price_diff
#         end
#     end
#     largest_diff.select { |days| price_diff.max }
# end


# p stock_picker([1,4,3,6])