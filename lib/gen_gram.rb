require_relative 'sentences.tab.rb'

NOUNS = ["wind", "ninja", "train", "you", "I", "letter"]
DET = ["the", "a"]
VERBS = ["whispered", "sang", "is", "gave"]
ADJ = ["sad", "late"]
DICTIONARY = {N: NOUNS, DET: DET, V: VERBS, A: ADJ}


module GenGram
  class Grammar

    def self.valid?(seq)
      begin
        GenGram::Parser.new.parse(seq)
        true
      rescue Racc::ParseError => e
        false
      end
    end

    def self.random_seq
      token_count = rand(0..8)
      token_count.times.map {
        category = [:N, :DET, :A, :V][rand(4)]
        list = DICTIONARY[category]
        word = list[rand(list.length)]
        [category, word]
      }
    end

    def self.random_sentence
      seq = nil
      loop do
        seq = random_seq
        if valid? seq.dup
          return seq
        end
      end
    end

  end
end
