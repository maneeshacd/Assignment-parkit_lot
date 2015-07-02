require "spec_helper"

describe Operation do

  describe '#allocate_slot' do
  	it 'allocate a particular slot for a car' do
      slots = [Slot.new(1),Slot.new(3)]
  	  expect(Operation.new.allocate_slot("KA-01-HH-1234", "white", slots)).to be_kind_of(String)
  	end
  end

  describe '#registration_numbers_for_cars_with_colour' do
    it 'registration numbers of cars with a particular color' do
      slots = [Slot.new(1),Slot.new(3)]
      expect(Operation.new.registration_numbers_for_cars_with_colour("white", slots)).to be_kind_of(String)
    end
  end

  describe '#slot_numbers_for_cars_with_colour' do
    it 'slot numbers of cars with a particular color' do
      slots = [Slot.new(1),Slot.new(3)]
      expect(Operation.new.slot_numbers_for_cars_with_colour("white", slots)).to be_kind_of(String)
    end
  end

  describe '#slot_number_for_registration_number' do
    it 'returns slot no: for a particular reg. no:' do
      slots = [Slot.new(1),Slot.new(3)]
      expect(Operation.new.slot_number_for_registration_number("KA-01-HH-1234", slots)).to eq("not found")
      expect(Operation.new.slot_number_for_registration_number("white", slots).to_i).should_not eq(0)
    end
  end

  describe '#leave' do
    it 'leave slots' do
      slots = [Slot.new(1),Slot.new(3)]
      slot = slots.first
      expect(Operation.new.leave(slot.slot_number, slots)).to eq("Slot number #{slot.slot_number} is free\n")
    end
  end

  describe '#status' do
    it 'status of slots' do
      slots = [Slot.new(1),Slot.new(3)]
      expect(Operation.new.status(slots)).to be_kind_of(String)
    end
  end

  describe '#command_input' do
    it 'returns methods for each command' do
      slots = [Slot.new(1),Slot.new(3)]
      expect(Operation.new.command_checking("create_parking_lot 6", slots)).to be_kind_of(String)
    end
  end

end
