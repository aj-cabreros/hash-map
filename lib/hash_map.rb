require_relative 'linked_list'

class HashMap
  attr_accessor :buckets

  LOAD_FACTOR = 0.75

  def initialize
    @buckets = Array.new(16, nil)
  end

  def to_s
    buckets.each_with_index do |list, index|
      if list.nil?
        puts "Index: #{index} || nil"
      else
        print "Index: #{index} || "
        node = list.head
        loop do
          if node.nil?
            puts "nil \n"
            break
          else
            print "#{node.value} -> "
            node = node.next_node
          end
        end
      end
    end
    '' # return a str, otherwise prints object reference
  end

  def hash(key)
    hash_code = 0
    prime_number = 31

    key.each_char { |char| hash_code = prime_number * hash_code + char.ord }

    hash_code
  end

  def index(key)
    index = hash(key) % buckets.length

    raise IndexError if index.negative? || index >= @buckets.length

    index
  end

  # returns node depending on yield block
  def get_node(list)
    node = list.head
    loop do
      break if node.nil?

      return node if yield(node)

      node = node.next_node
    end
  end

  def set(key, value)
    bucket_index = index(key)

    if buckets[bucket_index].nil?
      buckets[bucket_index] = LinkedList.new
      buckets[bucket_index].append({ key => value })
      return
    end

    list = buckets[bucket_index]

    node = get_node(list) { |node| node.value.key?(key) }

    if node.nil?
      list.append({ key => value })
    else
      node.value = { key => value }
    end

    return unless length > buckets.length * LOAD_FACTOR

    new_max_index = buckets.length / LOAD_FACTOR
    buckets[new_max_index.round] = nil

    entries = self.entries
    clear
    entries.each do |hash|
      set(hash.keys.first, hash.values.first)
    end
  end

  def iterator(list)
    return 0 if list.nil?

    node = list.head
    index = 0
    loop do
      break if node.nil?

      yield(node, index)
      index += 1
      node = node.next_node
    end
  end

  def get(key)
    index = index(key)
    return nil if buckets[index].nil?

    list = buckets[index]
    node = get_node(list) { |node| node.value.key?(key) }
    if node.nil?
      nil
    else
      node.value[key]
    end
  end

  def has?(key)
    value = get(key)
    if value.nil?
      false
    else
      true
    end
  end

  def remove(key)
    index = index(key)
    return nil if buckets[index].nil?

    list = buckets[index]

    node = list.head
    list_index = 0
    loop do
      break if node.nil? || node.value.key?(key)

      list_index += 1
      node = node.next_node
    end
    if node.nil?
      nil
    else
      value = node.value[key]
      list.remove_at(list_index)
      value
    end
  end

  def length
    total_nodes = 0
    @buckets.each do |list|
      list_length = if list.nil?
                      0
                    else
                      list.size
                    end

      total_nodes += list_length
    end
    total_nodes
  end

  def clear
    @buckets.each_with_index do |list, index|
      next if list.nil?

      buckets[index] = nil
    end
  end

  def keys
    keys = []
    @buckets.each do |list|
      iterator(list) { |node, _| keys.push node.value.keys.first }
    end
    keys
  end

  def values
    values = []
    @buckets.each do |list|
      iterator(list) { |node, _| values.push node.value.values.first }
    end
    values
  end

  def entries
    entries = []
    @buckets.each do |list|
      iterator(list) { |node, _| entries.push node.value }
    end
    entries
  end
end
