require "byebug"

def iter_range(first_ele, last_ele)
  return [] if last_ele < first_ele

  result = []
  (first_ele...last_ele).each do |i|
    result << i
  end

  result

end

def recur_range(first_ele, last_ele)
  return [] if last_ele-1 < first_ele

  [first_ele] + recur_range(first_ele+1, last_ele)
  
end

  # p iter_range(2, 7)
  # p recur_range(2,7)

def exponentiation_1(b, n)
  return 1 if n == 0
  b * exponentiation_1(b, n - 1)
end
  



  def exp(b, n)
    return 1 if n == 0
    b * exponentiation_1(b, n - 1)
  end

  def exponentiation_2(b, n)
    return 1 if n == 0
    return b if n == 1
    #if n.even? then we want to (b**n/2)*(b**n/2) 
    #if n.odd? (b ** (n-1)/2) * (b ** (n-1)/2)
    
    if n.even?
      exponentiation_2(b, n/2) ** 2
    else
      b * (exponentiation_2(b, (n - 1) / 2) ** 2)
    end
  end
  # p exponentiation_2(999, 87)

  def deep_dup(ele)
    if !ele.is_a?(Array)
      return [ele]
    else 
      sub_array = []
      ele.each { |element| sub_array << element}
      return sub_array
    end 
    deep_dup(ele[0]) +  deep_dup(ele[1..-1]) 
  end

  # p [1,2,[:a,:b],:c].object_id
  # p deep_dup([1,2,[:a,:b],:c]).object_id



  def fibonacci(n)
    return [1] if n <= 1
    return [1, 1] if n == 2
    prev_1 = fibonacci(n - 1)
    prev_1 + [prev_1[-1] + prev_1[-2]]
  end


  # p fibonacci(20)
  

  def bsearch(arr, target)
    mid_i = arr.length / 2
    return mid_i if arr[mid_i] == target
    return nil if arr.length <= 2 && !arr.include?(target)

    left_arr = arr[0...mid_i]
    right_arr = arr[mid_i + 1..-1]

    if target < arr[mid_i]
      return bsearch(left_arr, target)
    else
      return nil if bsearch(right_arr, target) == nil  
      return bsearch(right_arr, target) + mid_i + 1 
    end

  end

# p bsearch([1, 2, 3], 1) # => 0
# p bsearch([2, 3, 4, 5], 3) # => 1
# p bsearch([2, 4, 6, 8, 10], 6) # => 2
# p bsearch([1, 3, 4, 5, 9], 5) # => 3
# p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
# p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
# p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil


def merge_sort(arr)
  return arr if arr.length == 1
  mid_idx = arr.length / 2 
  left_arr = arr[0...mid_idx]
  right_arr = arr[mid_idx..-1]

  merge(merge_sort(left_arr), merge_sort(right_arr))
end

def merge(left_arr, right_arr)
  sorted = []
  while !left_arr.empty? && !right_arr.empty?
    if left_arr[0] < right_arr[0]
      sorted << left_arr.shift
    elsif right_arr[0] <= left_arr[0]
      sorted << right_arr.shift
    end
  end

  sorted + left_arr + right_arr
end

p merge_sort([38, 27, 43, 3, 9, 82, 10])