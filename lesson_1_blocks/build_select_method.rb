def select(array)
  counter = 0
  return_arr = []

  while counter < array.size
    value = yield(array[counter])
    value ? return_arr << value : nil
    counter += 1
  end

  return_arr
end

array = [1, 2, 3, 4, 5]
p array.select { |num| num.odd? }
p array.select { |num| puts num }
p array.select { |num| num + 1 }
