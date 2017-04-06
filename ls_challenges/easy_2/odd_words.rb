# input: string
# output: string
# rules:
# => words have 1 or more, but at most 20 letters
# => input text has 1 or more words, seperated by 1 or more spaces
# => input text is terminated by 0 or more spaces and a point
# => output text should have words seperated by a single space with the last word terminated by a point
# => output text - odd words are reverse, evens are echoed

# algorithm:
# => get rid of extra spaces between words
# => split or scan over input (exclude the final point)
# => iterate over array and reverse odd words

def odd_words(str)
  raise ArgumentError, "Invalid input." if str.split.any? { |word| word.size > 20 } ||
                                           str.split.any? { |word| word.scan(/[^a-zA-Z.]/).size > 0 } ||
                                           str.split.size < 1

  result = str.delete(".").split.map.with_index do |word, idx|
    idx.odd? ? word.reverse : word
  end
  result.join(' ') + '.'
end


p odd_words("whats the matter with kansas .") # == "whats eht matter htiw kansas."
# p odd_words("")
# p odd_words("   .")
# odd_words("whats the   matter with   tiffaeeeeeeeeeeeeeeny.")
