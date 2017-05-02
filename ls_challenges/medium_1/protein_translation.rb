require 'pry'

class InvalidCodonError < StandardError
end

class Translation

  CODONS_AND_PROTEINS = {
    "Methionine" => ['AUG'],
    "Phenylalanine" => ['UUU', 'UUC'],
    "Leucine" => ['UUA', 'UUG'],
    "Serine" => ['UCU', 'UCC', 'UCA', 'UCG'],
    "Tyrosine" => ['UAU', 'UAC'],
    "Cysteine" => ['UGU', 'UGC'],
    "Tryptophan" => ['UGG'],
    "STOP" => ['UAA', 'UAG', 'UGA']
  }

  def self.of_codon(rna)
    CODONS_AND_PROTEINS.select { |key, value| value.include?(rna) }.keys.first
  end

  def self.of_rna(strand)
    #fail InvalidCodonError if CODONS_AND_PROTEINS.keys.include?(strand) == false

    result = []
    strand.scan(/.../) do |codon|
      CODONS_AND_PROTEINS.each do |key, value|
        return result if CODONS_AND_PROTEINS["STOP"].include?(codon)
        result << key if value.include?(codon)
      end
    end
    result
  end
end

# p Translation.of_rna('CARROT')
