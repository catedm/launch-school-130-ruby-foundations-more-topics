# input: integer
# output: all of the integers divisors

def divisors(num)
  (1..num).each_with_object([]) do |int, obj|
    obj << int if num % int == 0
  end
end

p divisors(1) == [1]
p divisors(7) == [1, 7]
p divisors(12) == [1, 2, 3, 4, 6, 12]
p divisors(98) == [1, 2, 7, 14, 49, 98]
p divisors(99400891) == [1, 9967, 9973, 99400891] # may take a minute
