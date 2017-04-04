require 'pry'

def max_rotation(num)
  num = num.to_s.split('')
  result = ''
  
  until num.empty?
    num = num[0..-1].rotate
    result << num.shift
  end

  result.to_i
end

p max_rotation(735291) == 321579
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(105) == 15 # the leading zero gets dropped
p max_rotation(8_703_529_146) == 7_321_609_845
