def bad_two_sum?(arr,target)
  arr.each_with_index do |start,i|
    (i+1...arr.length).each do |j|
      return true if start + arr[j] == target
    end
  end
  false
end

arr = [0, 1, 5, 7]
p bad_two_sum?(arr, 6) # => should be true
p bad_two_sum?(arr, 10) # => should be false


# REMOVE DUP!!!
def okay_two_sum?(arr,target)
  arr = arr.sort
  arr.each_with_index do |el,i|
    difference = target - el
    dup = arr.dup
    dup.delete_at(i)
    return true if dup.binary_search(difference)
  end
  false

end

class Array
  def binary_search(target)
    return false if self.empty?
    middle = self.length/2
    if self[middle] == target
      return true
    elsif self[middle] < target
      right = self[middle+1..-1]
      right.binary_search(target)
    else
      left = self[0...middle]
      left.binary_search(target)
    end
  end
end
arr = [0, 1, 5, 7]
p okay_two_sum?(arr, 6) # => should be true
p okay_two_sum?(arr, 10) # => should be false

def two_sum?(arr,target)
  hash = Hash.new(0)
  arr.each do |el|
    hash[el] += 1
    difference = target - el
    if el == difference
      return true if hash[difference] > 1
    else
      return true if hash[difference] > 0
    end
  end
  false
end

arr = [0, 1, 5, 7]
p two_sum?(arr, 6) # => should be true
p two_sum?(arr, 10) # => should be false

def four_sum?(arr, target)
  hash = Hash.new { |h, v| h[v] = [] }
  (0...arr.length - 1).each do |i|
    (i + 1...arr.length).each do |j|
      sum = arr[i] + arr[j]
      hash[sum] << [i, j]
    end
  end
  # p hash
  hash.each do |first_number, first_pairs|
    second_number = target - first_number
    if hash.has_key?(second_number)
      second_number_values = hash[second_number]
      # uniq on first pairs and second pairs
      second_number_values.each do |x2, y2|
        first_pairs.each do |x1, y1|
          if [x1, y1, x2, y2].uniq.length == 4
            # p [x1, y1, x2, y2]
            return true
          end
        end
      end
    end
  end
  false
end

arr = (0..5000).to_a
p four_sum?(arr, 4994) # => should be true
p four_sum?(arr, 40) # => should be false
