# calculate hamming_distance
# if distances are unequal, compute up to the shorter length
# cannot actually mutuate strands in any given case
require 'pry'

class DNA
  attr_reader :given_strand

  def initialize(given_strand)
    @given_strand = given_strand
  end

  def hamming_distance(strand_two)
    combinations(strand_two).count { |pair| pair.uniq.size == 2 }
  end

  def combinations(strand)
    given_strand.chars.zip(strand.chars).delete_if { |a, b| a.nil? || b.nil? }
  end
end


test1 = DNA.new('GACTACGGACAGGGTAGGGAAT')
p test1.hamming_distance('GACATCGCACACC')
