def zipper(arr1, arr2)
  arr1.each_with_index.with_object([]) do |(element, index), result|
    result << [element, arr2[index]]
  end
end


p zipper([1, 2, 3], [4, 5, 6]) # == [[1, 4], [2, 5], [3, 6]]
