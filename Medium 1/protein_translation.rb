require 'pry'
class InvalidCodonError < StandardError
end

class Translation 
  PROTEINS = {"AUG": "Methionine", "UUU": "Phenylalanine", "UUC": "Phenylalanine",
    "UUA": "Leucine", "UUG": "Leucine", "UCU": "Serine", "UCC": "Serine",
    "UCA": "Serine", "UCG": "Serine", "UAU": "Tyrosine", "UAC": "Tyrosine",
    "UGU": "Cysteine", "UGC": "Cysteine", "UGG": "Tryptophan", 
    "UAA": "STOP", "UAG": "STOP", "UGA": "STOP"
  }
  
  def self.of_codon(codon)
    PROTEINS.fetch(codon.to_sym)
  end
  
  def self.rna_to_codon(strand)
    strand.scan(/.{3}/)
  end
  
  def self.of_rna(strand)
    # binding.pry
    raise InvalidCodonError if strand.match(/[^UGCA]/) != nil
    
    translation = self.rna_to_codon(strand).map do |codon|
      Translation.of_codon(codon)
    end
    
    stop_index = translation.index("STOP")
    if stop_index == nil
      translation
    else
      translation[0...stop_index]
    end
    
  end
end

# Translation.of_rna('CARROT')

#++++++++++++++++++++++++++++++Other nice solution===========================
# class InvalidCodonError < StandardError
# end
# #
# module Translation
#   CODON_PROTEIN = {
#     'AUG' => 'Methionine',    'UUU' => 'Phenylalanine',
#     'UUC' => 'Phenylalanine', 'UUA' => 'Leucine',
#     'UUG' => 'Leucine',       'UCU' => 'Serine',
#     'UCC' => 'Serine',        'UCA' => 'Serine',
#     'UCG' => 'Serine',        'UAU' => 'Tyrosine',
#     'UAC' => 'Tyrosine',      'UGU' => 'Cystine',
#     'UGC' => 'Cystine',       'UGG' => 'Tryptophan',
#     'UAA' => 'STOP',          'UAG' => 'STOP',
#     'UGA' => 'STOP'
#   }

#   def self.of_codon(codon)
#     CODON_PROTEIN.fetch(codon) { fail InvalidCodonError }
#   end

#   def self.of_rna(strand)
#     strand.scan(/.../).take_while { |codon| of_codon(codon) != 'STOP' }
#                       .map { |codon| of_codon(codon) }
#   end
# end