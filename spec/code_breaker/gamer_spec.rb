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
      before do
        allow(Gamer.new).to receive(:load_data).and_return(User.new(name:"ABCD",turns:2,complite:3))
      end
      it "must save data from array @gamers to file" do
       allow(File).to receive(:open).with("users_data.yaml","w")
      end
    end
    context "#load_data" do
       it "if file not found tell user about this fail" do

       end

       it "must load some data from file to array @gamers" do

       end
    end

  end
end
