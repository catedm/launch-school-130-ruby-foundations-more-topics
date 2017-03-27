require 'pry'

def birds_method(array)
  yield(array)
end

array = %w(raven finch hawk eagle)

birds_method(array) do |_,_, *birds_of_prey|
  puts "Two birds of prey are the #{birds_of_prey.join(' and ')}."
end
