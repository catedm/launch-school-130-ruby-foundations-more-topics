# input: starting val, ending val, step val, and a block
# output: whatever is returned by the block

def step(start_val, end_val, step)
  while start_val <= end_val
    yield(start_val)
    start_val += step
  end
  start_val - step
end



p step(1, 90, 3) { |value| puts "value = #{value}" }

# value = 1
# value = 4
# value = 7
# value = 10
