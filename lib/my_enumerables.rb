module Enumerable
  # Your code goes here
  def my_each_with_index(&block)
    if block_given?
      index = 0
      for item in self
        block.call(item, index)
        index += 1
      end
    end
  end

  def my_select(&block)
    if block_given?
      result = []
      for item in self
        result << item if block.call(item)
      end
      result
    end
  end

  def my_all?(&block)
    if block_given?
      for item in self
        return false unless block.call(item)
      end
      return true
    end
  end

  def my_any?(&block)
    return unless block_given?

    for item in self
      return true if block.call(item)
    end
    return false
  end

  def my_none?(&block)
    return unless block_given?

    for item in self
      return false if block.call(item)
    end
    return true
  end

  def my_count(&block)
    count = 0
    if !block_given?
      for _item in self
        count += 1
      end
      return count
    end

    for item in self
      count += 1 if block.call(item)
    end
    return count
  end

  def my_map(&block)
    if block_given?
      result = []
      for item in self
        result << block.call(item)
      end
      return result
    end
  end

  def my_inject(initial_value = nil, &block)
    accumulator = initial_value

    for item in self
      if accumulator.nil?
        accumulator = item
      else
        accumulator = block.call(accumulator, item)
      end
    end

    return accumulator
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each(&block)
    if block_given?
      for item in self
        block.call(item)
      end
    end
  end
end
