require 'pry'

class Series
  def initialize(str)
    @series = str
  end

  def slices(slice)
    arr = @series.chars.map(&:to_i)
    raise ArgumentError if slice > arr.size
    arr.each_cons(slice).to_a
  end
end

n_series = Series.new('92834')
p n_series.slices(1)
