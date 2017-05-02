require 'pry'

class Atbash
  LETTER_PAIRS = ('a'..'m').to_a.zip(('n'..'z').to_a.reverse)

  def self.encode(word)
    encoded_word = word.delete('^a-zA-Z0-9').downcase.gsub!(/./) do |char|
      char =~ /[0-9]/ ? char : encode_character(char)
    end

    encoded_word.chars.each_slice(5).map(&:join).join(' ')
  end

  def self.encode_character(char)
    pair = LETTER_PAIRS.select { |letters| letters.include?(char) }.first
    char == pair[0] ? pair[1] : pair[0]
  end
end


Atbash.encode('mindblowingly')
