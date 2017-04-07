# Write a program that, given a word, computes the scrabble score for that word.

# Letter                           Value
# A, E, I, O, U, L, N, R, S, T       1
# D, G                               2
# B, C, M, P                         3
# F, H, V, W, Y                      4
# K                                  5
# J, X                               8
# Q, Z                               10

require 'pry'

LETTERS_AND_VALUES = {
  ['A', 'E', 'I', 'O', 'U', 'L', 'N', 'R', 'S', 'T'] => 1,
  ['D', 'G'] => 2,
  ['B', 'C', 'M', 'P'] => 3,
  ['F', 'H', 'V', 'W', 'Y'] => 4,
  ['K'] => 5,
  ['J', 'X'] => 8,
  ['Q', 'Z'] => 10
}

class Scrabble
  def initialize(word)
    @word = word
  end

  def score
    return 0 if @word.nil?

    sum = 0
    word_array = @word.upcase.split('')
    LETTERS_AND_VALUES.each do |letters, value|
      word_array.each do |w_letter|
        letters.include?(w_letter) ? sum += value : sum += 0
      end
    end
    sum
  end

  def self.score(word)
    new(word).score
  end
end

p Scrabble.new("cabbage").score
