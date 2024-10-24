class LinkedList
  attr_accessor :head, :tail

  def initialize
    @head = Node.new
    @tail = Node.new
    head.next_node = tail
  end

  def append(value)
    node = Node.new
    node.value = value

    if head.value.nil?
      self.head = node
      self.tail = node
    else
      tail.next_node = node
      self.tail = node
    end
  end

  def prepend(value)
    node = Node.new
    node.value = value
    node.next_node = head
    @head = node
  end

  def size
    node = head
    count = 0
    loop do
      break if node.nil?

      count += 1
      node = node.next_node
    end
    count
  end

  def at(index)
    node = head
    count = 0
    if index.negative? || index > (size - 1) || !index.is_a?(Integer)
      puts 'invalid index for list'
    else
      loop do
        node = node.next_node
        count += 1
        break if index == count
      end
    end
    node
    # node.value
  end

  def pop
    if head == tail
      @head = nil
      @tail = nil
    else
      node = head
      node = node.next_node until node.nil? || node.next_node == tail
      self.tail = (node)
      node.next_node = nil
    end
  end

  def contains?(value)
    node = head

    loop do
      break if node.nil? || node.value.eql?(value)

      node = node.next_node
    end
    if node.nil?
      false
    else
      true
    end
    # node.value
  end

  def find(value)
    node = head
    index = 0
    loop do
      node = node.next_node
      index += 1
      break if node.nil? || node.value.eql?(value)
    end
    if node.nil?
      nil
    else
      index
    end
  end

  def to_s
    node = head
    loop do
      if node.nil?
        print 'nil'
        break
      else
        print "#{node.value} -> "
        node = node.next_node
      end
    end
    '' # return a str, otherwise prints object reference
  end

  # Extra Credit

  def insert_at(value, index)
    if index.negative? || index > size - 1
      puts 'invalid index'
    elsif index.zero?
      prepend(value)
    elsif index == size
      append(value)
    else
      node = Node.new
      node.value = value
      before_node = at(index - 1)
      after_node = at(index)
      before_node.next_node = (node)
      node.next_node = (after_node)
    end
  end

  def remove_at(index)
    if index.negative? || index > size - 1
      puts 'invalid index'
    elsif index.zero?
      shift
    elsif at(index) == tail
      pop
    else
      node = head
      count = 0
      loop do
        break if node == tail || count == index - 1

        node = node.next_node
        count += 1
      end
      node.next_node = at(index + 1)
    end
  end

  def shift
    @head = head.next_node
  end
end

class Node
  attr_accessor :value, :next_node

  def initialize
    @value = nil
    @next_node = nil
  end
end
