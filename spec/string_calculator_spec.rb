require_relative '../lib/string_calculator'

RSpec.describe StringCalculator do
  describe '#add' do
    context "valid scenarios" do
      it 'returns 0 for an empty string' do
        expect(StringCalculator.add('')).to eq(0)
      end

      it 'returns the number for a single number' do
        expect(StringCalculator.add('1')).to eq(1)
      end

      it 'returns the sum of two numbers' do
        expect(StringCalculator.add('1,5')).to eq(6)
      end

      it 'allows new lines between numbers' do
        expect(StringCalculator.add("1\n2,3")).to eq(6)
      end

      it 'allows new lines between numbers' do
        expect(StringCalculator.add("//;\n2;3;4\n5")).to eq(14)
      end

      it "should handle delimiters of any length" do
        expect(StringCalculator.add("//[***]\n1***2***3")).to eq(6)
      end
    end

    context "invalid scenarios" do 
      it "should throw an exception if a single negative number is passed" do
        expect { StringCalculator.add('-1,2') }.to raise_error(ArgumentError, "Negatives not allowed: -1")
      end

      it 'should raise error' do
        expect { StringCalculator.add('4,5,\n6') }.to raise_error(ArgumentError, "Invalid input")
      end
    end
  end
end