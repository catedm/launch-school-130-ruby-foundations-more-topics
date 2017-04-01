require 'pry'

class Anagram
  attr_reader :anagram

  def initialize(anagram)
    @anagram = anagram
  end

  def match(list)
    list.select { |word| anagram?(word) }
  end

  private

  def anagram?(word)
    letters(word) == letters(anagram) && word.downcase != anagram
  end

  def letters(word)
    word.downcase.chars.sort
  end
end
