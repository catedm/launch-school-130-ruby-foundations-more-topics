require 'pry'

def drop_while(array)
  index = 0
  while index < array.size && yield(array[index])
    index += 1
  end
  array[index..-1]
end


p drop_while([1, 2, 3, 4, 5, 0]) { |i| i < 3 }   #=> [3, 4, 5, 0]

p drop_while([1, 3, 5, 6]) { |value| value.odd? } # == [6]
p drop_while([1, 3, 5, 6]) { |value| value.even? } # == [1, 3, 5, 6]
p drop_while([1, 3, 5, 6]) { |value| true } == []
p drop_while([1, 3, 5, 6]) { |value| false } == [1, 3, 5, 6]
p drop_while([1, 3, 5, 6]) { |value| value < 5 } == [5, 6]
p drop_while([]) { |value| true } == []
