class MyStack
  def initialize
    @store = []
  end

  def pop
    @store.pop[:value] unless empty?
  end

  def push(value)
    @store.push({
      max: new_max(value),
      min: new_min(value),
      value: value
    })
  end

  def peek
    @store.last
  end

  def size
    @store.length
  end

  def empty?
    @store.empty?
  end

  def max
    peek[:max]
  end

  def min
    peek[:min]
  end

  private

  def new_max(val)
    empty? ? val : [max, val].max
  end

  def new_min(val)
    empty? ? val : [min, val].min
  end

end

class MinMaxStackQueue
  def initialize
    @stack1 = MyStack.new
    @stack2 = MyStack.new
    @current_stack = @stack1
    @other_stack = @stack2
  end

  def enqueue(el)
    @current_stack.push(el)
  end

  def dequeue
    until @current_stack.size == 1
      @other_stack.push(@current_stack.pop)
    end
    @current_stack,@other_stack = @other_stack,@current_stack
    @other_stack.pop
  end

  def size
    @current_stack.size
  end

  def empty?
    @current_stack.empty?
  end

  def max
    @current_stack.max
  end

  def min
    @current_stack.min
  end
end
