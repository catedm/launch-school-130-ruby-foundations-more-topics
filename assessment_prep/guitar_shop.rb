# ASSESSMENT EXAMPLE: GuitarShop

# In order to illustrate topics on the 120 assessment, I will use a Guitar Shop.
# This Guitar Shop will have Guitars & amps of different types. Our shop will have
# an inventory. Our shop will have customers.
require 'pry'

class Guitar
  attr_reader :year, :make, :color
  attr_accessor :cost

  def initialize(year, make, color, cost)
    @year = year
    @make = make
    @color = color
    @cost = cost
  end

  def to_s
    "#{self.class} #{make}. #{color}, #{year}.\n Price: $#{cost}"
  end
end

class Fender < Guitar
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
    @cash = 10000
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

class BuildYourEmpire
  def initialize
    @shop = Customer.new()
  end

  def play
  end
end

guitar1 = Fender.new(1989, "Stratocastor", "Red", 12000)
songbird = GuitarShop.new
songbird.buy_item(guitar1)
songbird.display_inventory
bob = Customer.new("Bob", 13000)
bob.buy_item(guitar1)
songbird.display_inventory
