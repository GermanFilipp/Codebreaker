require 'spec_helper'

module CodeBreaker
  describe Gamer do
    context "#initialize" do
      it "@gamers must be array" do
        expect(subject.instance_variable_get(:@gamers).is_a?(Array)).to eq(true)
      end
      it "array @gamers must be empty" do
        expect(subject.instance_variable_get(:@gamers)).to match([])
      end
    end
   context "#add" do

     it "must add object in array @gamers" do
       subject.instance_variable_get(:@gamers).push "something"
       expect(subject.instance_variable_get(:@gamers).size).to eq(1)
     end
    end
    context "#save_data" do

      it "not raise exception" do
        expect {subject.save_data}.not_to raise_exception
      end
      it "if file not found tell user about this fail" do
        allow(File).to receive(:exist?).and_return(false)
        expect(subject.save_data).to eq("file not found")
      end
    end
    context "#load_data" do
       it "not raise exception" do
         expect {subject.load_data}.not_to raise_exception
       end
       it "if file not found tell user about this fail" do
         allow(File).to receive(:exist?).and_return(false)
         expect(subject.load_data).to eq("file not found")
       end

    end

    end

  end
end
