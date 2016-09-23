def my_min2(array)
  minimum = array.first
  array.each do |num|
    minimum = num if num < minimum
  end
  minimum
end

def my_min1(array)
  array.each_with_index do |num1,i|
    minimum = num1
    array.each_with_index do |num2,j|
      next if i==j
      minimum = num2 if num2 < minimum
    end
    return minimum if minimum==num1
  end
end

list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
p my_min1(list)
p my_min2(list)

def largest_contigous_subsum1(array)
  sub_arrays = []
  for i in (0...array.length)
    for j in (i...array.length)
      sub_arrays << array[i..j]
    end
  end
  sums = sub_arrays.collect do |sub_array|
    total = 0
    sub_array.each do |int|
      total += int
    end
    total
  end
  max = sums.first
  sums.each do |sum|
    max = sum if sum > max
  end
  max
end

def largest_contigous_subsum2(array)
  # largest_sums = []
  # running_sum = 0
  # array.each do |num|
  #   running_sum += num
  #   largest_sums << running_sum

  largest = nil
  (0...array.length - 1).each do |i|
    sum = array[i]
    (i + 1...array.length).each do |j|
      sum += array[j]
      largest = sum if largest.nil? || sum > largest
    end
  end
  largest

end

def largest_contiguous_subsum3(array)
  current_sum, largest = 0, array.first
  array.each do |el|
    current_sum = [el, current_sum + el].max
    largest = [largest, current_sum].max
  end
  largest
end

list = [2, 3, -6, 7, -6, 7]
list2 = [-3, -1, -2]
p largest_contigous_subsum1(list)
p largest_contigous_subsum2(list)
p largest_contiguous_subsum3(list)
p largest_contiguous_subsum3(list2)
