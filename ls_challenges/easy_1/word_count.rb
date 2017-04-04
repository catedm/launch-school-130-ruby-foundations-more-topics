# edge cases:
# => ignore punctuation
# => handles cramped lists
# =>
require 'pry'

class Phrase
  attr_reader :phrase

  def initialize(phrase)
    @phrase = phrase
  end

  def word_count
    counts = Hash.new(0)
    phrase.scan(/\b[\w']+\b/) do |word|
      counts[word.downcase] += 1
    end
    counts
  end
end

phrase = Phrase.new("car's : carpet as java : javascript!!&@$%^&")
p phrase.word_count
