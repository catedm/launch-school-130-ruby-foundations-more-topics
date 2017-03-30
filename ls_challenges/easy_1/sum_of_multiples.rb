# input: number
# output: number
# rules:
# => find sum of all multiples of particular numbers up to but not including the given num
# => write program that can find sum of multiples of a given set of numbers
# => if no set of numbers is given, default to 3 and 5
# => class method

# algorithm:
# => sum = []
# => 0.upto(end_num)

require 'pry'

class SumOfMultiples
  attr_reader :multiples

  def initialize(*multiples)
    @multiples = multiples
  end

  def self.to(end_num)
    new(3, 5).to(end_num)
  end

  def to(end_num)
    (0...end_num).select do |num|
      multiples.any? { |mult| num % mult == 0 }
    end.reduce(:+)
  end
end

SumOfMultiples.to(10) # == 4419
