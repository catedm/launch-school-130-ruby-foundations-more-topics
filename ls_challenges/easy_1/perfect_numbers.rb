# 3 categories
# => abundant: sum of positive divisors > number
# => perfect: sum of positive divisors = number
# => deficient: sum of positive divisors < number

# 6 = 1 + 2 + 3
# 28 = 1 + 2 + 4 + 7 + 14

# algorithm:
# => guard clase for negative inputs
# => use % to obtain positive divisors
# => case statement to return proper type
require 'pry'

class PerfectNumber

  def self.classify(num)
    raise RuntimeError if num < 2
    total = obtain_divisor_total(num)
    case
    when total > num then "abundant"
    when total == num then "perfect"
    when total < num then "deficient"
    end
  end

  def self.obtain_divisor_total(num)
    (1...num).select { |each| num % each == 0 }.reduce(:+)
  end
end
