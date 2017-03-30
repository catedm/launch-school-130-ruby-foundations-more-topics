# rules:
# => string can only contain 0, 1 and 2, anything else return 0
require 'pry'

class Trinary
  INVALID = /[^012]/
  attr_reader :trinary

  def initialize(string)
    @trinary = string
  end

  def to_decimal
    return 0 if trinary =~ INVALID
    result = []
    trinary.reverse.each_char.map(&:to_i).each_with_index do |num, idx|
      result << num*3**idx
    end
    result.reduce(:+)
  end
end

testing = Trinary.new('102012')
p testing.to_decimal
