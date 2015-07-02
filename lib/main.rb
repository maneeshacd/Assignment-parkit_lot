load "slots.rb"
load "operations.rb"

class Main

	slots = []

	if ARGV[0]
		Operation.new.file_input(slots)	
	else
		print "\nPlease type any of the following command as per your requirement: \n\n"
		print "1. create_parking_lot <n> - create parking lot with 'n' slots \n 
		2. park <registration number> <color> - allocate slot for a vehicle with a particular registration number and color \n
		3. registration_numbers_for_cars_with_colour <color> - return reg. numbers of cars with a particular color\n
		4. slot_numbers_for_cars_with_colour <color> - return slot numbers of cars with a particular color\n
		5. slot_number_for_registration_number <reg. number> - return slot number of car with a particular reg. number\n
		3. leave <slot number> - make a particular slot free \n
		4. status - status of all slots\n
		5. exit - exit from program\n\n
		Please enter command : \n\n\n"
		loop do
			command = gets.chomp
			print Operation.new.command_input(command, slots)
		end
	end
	
end


