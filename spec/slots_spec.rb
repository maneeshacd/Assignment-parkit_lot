require "spec_helper"

describe Operation do

  describe '#slot_creation' do
  	it 'create slots' do
  	  expect(Slot.new(1).slot_creation("KA-01-HH-1234", "white")).to be_kind_of(String)
  	end
  end

  describe '#leave_slot' do
    it 'leave slot' do
      expect(Slot.new(1).leave_slot).to eq(nil)
    end
  end

end
