require 'pry'

class Octal
  INVALID_OCTAL = /\D|[8-9]/
  attr_reader :digits

  def initialize(string)
    @digits = string
  end

  def to_decimal
    return 0 if digits =~ INVALID_OCTAL
    @digits = digits.split('').reverse.map(&:to_i)
    digits.map!.with_index { |n, i| n*8**i }.inject(:+)
  end
end

testing = Octal.new('233')
p testing.to_decimal
