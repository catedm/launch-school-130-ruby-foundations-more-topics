require 'pry'

class Fixnum
  NUMERALS = {
    1000 => 'M',
    900 => 'CM',
    500 => 'D',
    400 => 'CD',
    100 => 'C',
    90 => 'XC',
    50 => 'L',
    40 => 'XL',
    10 => 'X',
    9 => 'IX',
    5 => 'V',
    4 => 'IV',
    1 => 'I'
  }

  def to_roman
    number = self
    roman_number = ''
    NUMERALS.each do |value, letter|
      number_of_roman_letters = number / value
      roman_number += letter * number_of_roman_letters
      number -= number_of_roman_letters * value
    end
    roman_number
  end
end

p 48.to_roman
