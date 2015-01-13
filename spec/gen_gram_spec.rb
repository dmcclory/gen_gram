require 'spec_helper'

describe GenGram::Grammar do

  let(:ungrammatical_seq) { [[:DET, "The"], [:A, "sad"], [:V, "is"], [:N, "wind"], [:N, "train"]] }
  let(:grammatical_seq)  { [[:DET, "The"], [:N, "wind"], [:V, "is"], [:A, "sad"]] }

  describe "valid?" do
    context "given an ungrammatical sentence" do
      it "returns false" do
        expect(GenGram::Grammar.valid?(ungrammatical_seq)).to eq false
      end
    end
    context "given a grammatical sequence of tokens" do
      it "returns true" do
        expect(GenGram::Grammar.valid?(grammatical_seq)).to eq true
      end
    end
  end

end
