# input: array of integers
# output: missing integers btween first & last elements of array
# rules
# => find missing integers

# algorithm
# => create a new array
# => put all integers from first to last of arg in it
# => combine the two arrays
# => delete duplicates (uniq)
require "pry"

def missing(arg)
  result = (arg.first..arg.last).to_a
  result.select { |el| arg.include?(el) == false }
end

p missing([-3, -2, 1, 5]) # == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) # == []
p missing([1, 5]) # == [2, 3, 4]
p missing([6]) # == []
