# input: list of names
# output: list of names
# rules:
# => names in list are written in ROT13
# => ROT13 replaces a letter with the letter 13 letters after it in the alphabet
# => decipher and print each of the names

# algorithm:
# => alphabet array
# => iterate over list
# => break names down into chars
# => map the resulting array into chars + 13 in alphabet array
# => next if " "
# => join & print results
# => use downcase to sort and capitalize to finish
require 'pry'

PIONEERS = [
  "Nqn Ybirynpr",
  "Tenpr Ubccre",
  "Nqryr Tbyqfgvar",
  "Nyna Ghevat",
  "Puneyrf Onoontr",
  "Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv",
  "Wbua Ngnanfbss",
  "Ybvf Unyog",
  "Pynhqr Funaaba",
  "Fgrir Wbof",
  "Ovyy Tngrf",
  "Gvz Orearef-Yrr",
  "Fgrir Jbmavnx",
  "Xbaenq Mhfr",
  "Wbua Ngnanfbss",
  "Fve Nagbal Ubner",
  "Zneiva Zvafxl",
  "Lhxvuveb Zngfhzbgb",
  "Unllvz Fybavzfxv",
  "Tregehqr Oynapu"
].freeze

def rot13(encrypted_text)
  encrypted_text.each_char.reduce('') do |result, encrypted_char|
    result + decipher_character(encrypted_char)
  end
end


def decipher_character(encrypted_char)
  case encrypted_char
  when 'a'..'m', 'A'..'M' then (encrypted_char.ord + 13).chr
  when 'n'..'z', 'N'..'Z' then (encrypted_char.ord - 13).chr
  else                         encrypted_char
  end
end

PIONEERS.each do |encrypted_name|
  puts rot13(encrypted_name)
end
