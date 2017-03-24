require 'pry'

def count(array)
  count = 0
  array.each { |i| count += 1 if yield(i) }
  count
end

def count(array)
  array.select { |value| block_given? ? yield(value) : value }.size
end

p count([1,2,3,4,5]) { |value| value.odd? } == 3
p count([1,2,3,4,5]) { |value| value % 3 == 1 } == 2
p count([1,2,3,4,5]) { |value| true } == 5
p count([1,2,3,4,5]) { |value| false } == 0
p count([]) { |value| value.even? } == 0
p count(%w(Four score and seven)) { |value| value.size == 5 } == 2
