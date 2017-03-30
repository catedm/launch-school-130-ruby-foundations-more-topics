# rules:
# => starts from 2 up to some number
# => being the loop at first unmarked number (2)
# => must iteratively mark as composite (not prime), the multiples of each prime
# => must start with the multiples of 2

# algorithm:
# => initialize a data structure: hash, or 2 arrays
# => hash: keys would be 2 up to input number
# => use Hash#keys to iterate over numbers
# => mark each prime numbers multiples "C" for "composite"
# => begin each loop at the keys whose value is " "

require 'pry'
require 'prime'

class Sieve
  attr_reader :end_num

  def initialize(end_num)
    @end_num = end_num
  end

  def build_hash(hash, end_num)
    2.upto(end_num) { |num| hash[num] = " " }
  end

  def primes
    sieve = {}
    build_hash(sieve, end_num)
  
    sieve.each_pair do |key, value|
      key.prime? ? sieve[key] = "P" : sieve[key] = "C"
    end

    sieve.select { |_, v| v == "P" }.keys
  end

end
