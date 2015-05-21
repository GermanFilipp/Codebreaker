require 'spec_helper'

module CodeBreaker
  describe Game do


    context "#initialize" do
      it "secret code must be string" do
        expect(subject.instance_variable_get(:@secret_code).is_a?(String)).to eq(true)
      end

      it "set @available_hints to 4" do
        expect(subject.instance_variable_get(:@available_hints)).to eq 4
      end

      it "set @move to 5" do
        expect(subject.instance_variable_get(:@move)).to eq 5
      end
    end

    before do
      subject.start
    end

    context  "#start" do

      it "saves secret code" do
        expect(subject.instance_variable_get(:@secret_code)).not_to be_empty
      end

      it "saves 4 numbers secret code" do
        expect(subject.instance_variable_get(:@secret_code).size).to equal(4)
      end

      it "saves secret code with numbers from 1 to 6" do
        expect(subject.instance_variable_get(:@secret_code)).to match(/[1-6]+/)
      end

      it "must generate secret code" do
        allow(subject).to receive(:generate_code).and_return("1234")
        subject.start
        expect(subject.instance_variable_get(:@secret_code)).to eq "1234"
      end

    end

    context "#check_number" do

      before do
        subject.instance_variable_set :@secret_code , "1234"
      end
      it "return fail message if size != 4" do
        expect(subject.check_number "12324").to eq"something wrong with your number"
      end

      it "return fail message if it's not number " do
         expect(subject.check_number "asdf").to eq"fail number"
      end

      it "returns '+' when number is the same as one numbers and in the same position " do
        expect(subject.check_number "1666").to eq "+"
      end

      it "returns '-' when user guess number but in a different position" do
        expect(subject.check_number "2666").to eq "-"
      end

      it "should decrease move by 1" do
        expect{subject.check_number "1234"}.to change{subject.instance_variable_get(:@move)}.by(-1)
      end
    end

    context "#get_hint" do

      it "decrease @available_hints by 1" do
        expect{subject.get_hint}.to change{subject.instance_variable_get(:@available_hints)}.by(-1)
      end

      it "should return random number from secret code with a message" do
        subject.instance_variable_set(:@secret_code,"1345")
        allow(subject).to receive(:rand).with(4).and_return(3)
        expect(subject.get_hint).to eq "Number from secret code - 5. You have 3 hints"
      end
    end

  end
end