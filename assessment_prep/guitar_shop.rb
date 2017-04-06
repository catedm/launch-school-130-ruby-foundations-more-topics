# ASSESSMENT EXAMPLE: GuitarShop

# In order to illustrate topics on the 120 assessment, I will use a Guitar Shop.
# This Guitar Shop will have Guitars & amps of different types. Our shop will have
# an inventory. Our shop will have customers.
require 'pry'

module WhammyBar
  def whammable?
    true
  end
end

class Guitar
  attr_reader :year, :make, :color
  attr_accessor :cost

  @@total_number_of_guitars = 0

  def initialize(year, make, color, cost)
    @year = year
    @make = make
    @color = color
    @cost = cost
    @@total_number_of_guitars += 1
  end

  def to_s
    "#{self.class} #{make}. #{color}, #{year}.\n Price: $#{cost}"
  end

  def self.total_number_of_guitars
    @@total_number_of_guitars
  end

  # FAKE OPERATOR example
  # This method will use > to determine which item is more expensive
  def >(other_item)
    cost > other_item.cost
  end

  # CALLING METHODS W/ SELF example
  # must use self when referencing a setter method from within the class
  # this allows Rugy to disambiguate between initializing a local variable and calling the setter method
  # remember: calling self from within an instance method references the calling object
  def change_color(new_color)
    self.color = new_color
  end
end

class Fender < Guitar
  include WhammyBar

  def initialize(year, make, color, cost)
    super(year, make, color, cost)
  end
end

class Gibson < Guitar
  def initialize(year, make, color, cost)
    super(year, make, color, cost)
  end
end

class GuitarShop
  attr_reader :inventory
  attr_accessor :cash

  def initialize
    @inventory = []
    @cash = 100000
  end

  def buy_item(item)
    inventory << item
    @cash -= item.cost
  end

  def set_item_price(item, price)
    item.cost = price
  end

  def display_cash
    puts "You only have $#{self.cash} dollars"
  end

  def display_inventory
    puts "INVENTORY".center(90)
    puts "-" * 90
    inventory.each do |guitar|
      puts guitar
      puts ''
    end
  end

  def sell_item(item)
    inventory.delete(item)
  end
end

class Customer
  attr_reader :stuff, :cash, :name

  def initialize(name, cash)
    @name = name
    @cash = cash
    @stuff = []
  end

  def buy_item(item)
    stuff << item
    @cash -= item.cost
  end
end

guitar1 = Fender.new(1989, "Stratocastor", "Red", 12000)
p guitar1.whammable?
