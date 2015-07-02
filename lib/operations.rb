class Operation

	def allocate_slot(registration_number, color, slots)
		slots.each do |slot|
			if slot.registration_number.nil?
				slot.slot_creation(registration_number, color)
				return "Allocated slot number: #{slot.slot_number}"
			end
		end
		return "\nSorry, parking lot is full\n" 
	end

	def registration_numbers_for_cars_with_colour(color, slots)
		reg_numbers = []
		slots.each do |slot|
			reg_numbers << slot.registration_number if slot.color == color
		end
		return reg_numbers.join(", ")
	end

	def slot_numbers_for_cars_with_colour(color, slots)
		slot_numbers = []
		slots.each do |slot|
			slot_numbers << slot.slot_number if slot.color == color
		end
		return slot_numbers.join(", ")		
	end

	def slot_number_for_registration_number(reg_number, slots)
		slots.each do |slot|
			return slot.slot_number if slot.registration_number == reg_number
		end	
		return "not found"	
	end

	def leave(slot_number, slots)
		slots.each do |slot|
			if slot.slot_number == slot_number.to_i
				slot.leave_slot
				return "Slot number #{slot.slot_number} is free\n"
			end
		end	
	end

	def status(slots)
		status_table = ["slot no:\tregistration no:\tcolor\n"]
		slots.each do |slot|
			status_table << "#{slot.slot_number}\t\t#{slot.registration_number}\t\t#{slot.color}\n"
		end
		return status_table.join("\n")
	end

	def command_input(command, slots)
		case
			when command.start_with?("create_parking_lot") && command.split.size == 2 && command.split.last.to_i != 0				
				1.upto(command.split.last.to_i) {|i| slots << Slot.new(i)}
				return "Created a parking lot with #{command.split.last.to_i} slots\n"
			
			when command.start_with?("park") && command.split.size == 3			
				return "#{allocate_slot(command.split[1], command.split[2], slots)}\n"
			
			when command.start_with?("registration_numbers_for_cars_with_colour") && command.split.size == 2				
				return "#{registration_numbers_for_cars_with_colour(command.split[1], slots)}\n"
			
			when command.start_with?("slot_numbers_for_cars_with_colour") && command.split.size == 2		
				return "#{slot_numbers_for_cars_with_colour(command.split[1], slots)}\n"
			
			when command.start_with?("slot_number_for_registration_number") && command.split.size == 2
				return "#{slot_number_for_registration_number(command.split[1], slots)}\n"
		
			when command.start_with?("leave") && command.split.size == 2
				return leave(command.split[1], slots)
		
			when command == "status"
				return status(slots)

			when command == "exit"
				exit

			else
				print "Not a command\n"
		end
	end

	def file_input(slots)
		input = File.open(ARGV[0]).read
		output = File.open(ARGV[1], 'w')
		input.each_line do |line|
			output << command_input(line.gsub!("\n", ""), slots)
		end
	end
end