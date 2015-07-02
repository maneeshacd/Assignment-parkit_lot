class Slot

	attr_accessor :slot_number, :registration_number, :color

	def initialize(slot_number)
		@slot_number = slot_number
    @registration_number = nil
    @color = nil
  end

  def slot_creation(registration_number, color)
  	@registration_number = registration_number
    @color = color
  end

  def leave_slot
  	@registration_number = nil
    @color = nil
  end
end