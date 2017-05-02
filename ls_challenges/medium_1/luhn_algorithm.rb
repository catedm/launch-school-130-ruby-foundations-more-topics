require 'pry'

class Luhn
  def initialize(luhn)
    @luhn = luhn
  end

  def addends
    @luhn.to_s.split('').map(&:to_i).reverse.map!.with_index do |num, idx|
      idx.odd? ? (num *= 2) : num
      num > 10 ? (num -= 9) : num
    end.reverse
  end

  def checksum
    addends.reduce(:+)
  end

  def valid?
    checksum % 10 == 0
  end

  def self.create(number)
    0.upto(9) do |n|
      check = (number * 10) + n
      return check if new(check).valid?
    end
  end
end

# testing = Luhn.new(873_956)
# p testing.addends
# p testing.checksum
# p testing.valid?
number = Luhn.create(873_956)
