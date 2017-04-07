require 'pry'

class BeerSong
  class NoBottles
    def verse(_)
      "No more bottles of beer on the wall, no more bottles of beer.\n" \
      "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
    end
  end

  class OneBottle
    def verse(_)
      "1 bottle of beer on the wall, 1 bottle of beer.\n" \
      "Take it down and pass it around, no more bottles of beer on the wall.\n"
    end
  end

  class TwoBottles
    def verse(_)
      "2 bottles of beer on the wall, 2 bottles of beer.\n" \
      "Take one down and pass it around, 1 bottle of beer on the wall.\n"
    end
  end

  class NBottles
    def verse(num)
      left = num - 1
      "#{num} bottles of beer on the wall, #{num} bottles of beer.\n" \
      "Take one down and pass it around, #{left} bottles of beer on the wall.\n"
    end
  end

  BOTTLE_CLASSES = { 0 => NoBottles, 1 => OneBottle, 2 => TwoBottles,
                     3..99 => NBottles }

  def verse(num)
    BOTTLE_CLASSES.find do |cls, _|
      cls === num
    end.last.new.verse(num)
  end

  def verses(first_verse, last_verse)
    first_verse.downto(last_verse).map { |num| verse(num) }.join("\n")
  end

  def lyrics
    verses(99, 0)
  end
end
