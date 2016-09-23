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

  def values
    @store.map { |el| el[:value] }
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
  attr_reader :current_stack
  def initialize
    @inbox = MyStack.new
    @outbox = MyStack.new
    # @current_stack = @stack1
    # @other_stack = @stack2
  end

  def enqueue(el)
    @inbox.push(el)
  end

  def dequeue
    # until @current_stack.size == 1
    #   @other_stack.push(@current_stack.pop)
    # end
    # @current_stack, @other_stack = @other_stack, @current_stack
    # @other_stack.pop
    until @inbox.empty?
      @outbox.push(@inbox.pop)
    end
    @outbox.pop
    until @outbox.empty?
      @inbox.push(@outbox.pop)
    end
  end

  def size
    @inbox.size
  end

  def empty?
    @inbox.empty?
  end

  def max
    @inbox.max
  end

  def min
    @inbox.min
  end

  def values
    @inbox.values.each { |value| p value }
  end
end
