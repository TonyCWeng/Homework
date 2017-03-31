class Stack

  def initialize
    @stack = []
  end

  def add(el)
    @stack.push(el)
  end

  def remove
    @stack.pop(el)
  end

  def show
    @stack.dup
  end
end

class Queue

  def initialize
    @queue = []
  end

  def enqueue(el)
    @queue.unshift(el)
  end

  def dequeue(el)
    @queue.shift(el)
  end

  def show
    @queue.dup
  end
end

class Map

  def initialize
    @map = []
  end

  def assign(key, value)
    pair_index = @map.index {|k, v| k == key}
    pair_index ? @map[pair_index][1] = value : @map << [key, value]
    [key, value]
  end

  def lookup(key)
    @map.each do |k, v|
      return v if k == key
    end
  end

  def remove(key)
    @map.reject! {|k, v| k == key}
    nil
  end

  def show
    deep_dup(@map)
  end

  private
  def deep_dup(arr)
    arr.map { |el| el.is_a? Array ? deep_dup(el) : el}
  end
end
