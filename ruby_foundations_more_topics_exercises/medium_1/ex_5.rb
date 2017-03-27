require 'pry'

items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

gather(items) do |*args, l|
  puts args.join(', ')
  puts l
end

gather(items) do |a, *args , l|
  puts a
  puts args.join(', ')
  puts l
end

gather(items) do |a, *args|
  puts a
  puts args.join(', ')
end

gather(items) do |a, b, c, d|
  puts "#{a}, #{b}, #{c}, and #{d}"
end
