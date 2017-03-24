def compute
  return "Does not compute." unless block_given?
  yield
end

p compute { 5 + 3 } # == 8
p compute { 'a' + 'b' } # == 'ab'
p compute # == 'Does not compute.'

def compute2(arg)
  return "Does not compute." unless block_given?
  yield(arg)
end

p compute2(2) { |arg| arg + 3 } # == 8
p compute2('t') { |arg| arg + 'b' } # == 'ab'
p compute2("test") # == 'Does not compute.'
