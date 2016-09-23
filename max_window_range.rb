require_relative "min_max_stack_queue"

def windowed_max_range(array,window)
  current_max_range = nil
  (0..array.length-window).each do |i|
    #window = [arr[i], arr[i + 1], arr[i + 2]]
    chunk = array[i, window]
    chunk_max = chunk.max
    chunk_min = chunk.min
    chunk_range = chunk_max - chunk_min
    if current_max_range.nil? || chunk_range > current_max_range
      current_max_range = chunk_range
    end
  end
  current_max_range
end

# p windowed_max_range([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
# p windowed_max_range([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
# p windowed_max_range([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
# p windowed_max_range([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8

def windowed_max_range(array,window)
  greatest_max_range = nil
  stack_queue = MinMaxStackQueue.new
  (array.length).times do
    if stack_queue.size == window
      stack_queue.dequeue
    end
    stack_queue.enqueue(array.shift)
    if stack_queue.size == window
      current_max_range = stack_queue.max - stack_queue.min
      greatest_max_range = current_max_range if greatest_max_range.nil? || current_max_range > greatest_max_range
    end
  end
  greatest_max_range
end

p windowed_max_range([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
p windowed_max_range([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
p windowed_max_range([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
p windowed_max_range([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8
