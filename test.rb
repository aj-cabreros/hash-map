require_relative 'lib/hash_map'
require_relative 'lib/linked_list'

test = HashMap.new

# ====== Test #set ======

test.set('apple', 'red')
test.set('banana', 'yellow')
test.set('carrot', 'orange')
test.set('dog', 'brown')
test.set('elephant', 'gray')
test.set('frog', 'green')
test.set('grape', 'purple')
test.set('hat', 'black')
test.set('ice cream', 'white')
test.set('jacket', 'blue')
test.set('kite', 'pink')
test.set('lion', 'golden')
test.set('moon', 'silver')

test.set('apple', 'RED')
test.set('moon', 'SILVER')

# ====== Test #get ======

# p test.get('apple')
# p test.get('banana')
# p test.get('carrot')
# p test.get('dog')
# p test.get('elephant')
# p test.get('frog')
# p test.get('grape')
# p test.get('hat')
# p test.get('ice cream')
# p test.get('jacket')
# p test.get('kite')
# p test.get('lion')
# p test.get('moon')
# p test.get('keria') # this key is not in hash map

# ====== Test #has? ======

# puts test.has?('apple')
# puts test.has?('banana')
# puts test.has?('carrot')
# puts test.has?('dog')
# puts test.has?('elephant')
# puts test.has?('frog')
# puts test.has?('grape')
# puts test.has?('hat')
# puts test.has?('ice cream')
# puts test.has?('jacket')
# puts test.has?('kite')
# puts test.has?('lion')
# puts test.has?('moon')
# puts test.has?('keria') # this key is not in hash map

# ====== Test #remove ======

# p test.remove('apple')
# p test.remove('banana')
# p test.remove('carrot')
# p test.remove('dog')
# p test.remove('elephant')
# p test.remove('frog')
# p test.remove('grape')
# p test.remove('hat')
# p test.remove('ice cream')
# p test.remove('jacket')
# p test.remove('kite')
# p test.remove('lion')
# p test.remove('moon')
# p test.remove('keria') # this key is not in hash map

# ====== Test #length & #clear ======
# p test.length
# test.clear
# p test.length

# ====== Test #keys, #values, #entries ======
# p test.keys
# p test.values
# p test.entries

puts test
# puts "HashMap Length: #{test.length}"
