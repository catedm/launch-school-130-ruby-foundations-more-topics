# 1 = wink
# 10 = double blink
# 100 = close your eyes
# 1000 = jump
# 10000 = Reverse the order of the operations in the secret handshake.
#
# EVENTS = ["wink", "double blink", "close your eyes", "jump"]
# 31 = '11111'

# input:
#   - decimal number
#   - convert to binary
#
# algorithm:
#   - take binary number
#   - use EVENTS lookup table to build result
#
# validation
#   - invalid binary? return 0

require 'pry'

class SecretHandshake
  attr_reader :binary

  EVENTS = ['wink', 'double blink', 'close your eyes', 'jump']

  def initialize(binary)
    @binary = binary.is_a?(String) ? binary.to_i.to_s(2).chars : binary.to_s(2).chars
  end

  def commands
    result = []
    orig_binary = binary

    binary.size >= 5 ? slice_binary_array(binary) : binary
    binding.pry
    binary.reverse!.each_with_index do |_, idx|
      result << EVENTS[idx] if binary[idx] == '1'
    end

    orig_binary.size == 5 && orig_binary[0] == '1' ? result.reverse : result
  end

  def slice_binary_array(binary)
    @binary = binary[1..-1]
  end
end

handshake = SecretHandshake.new(19)
p handshake.commands
