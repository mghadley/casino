class Slots
	attr_accessor :player
	
	def self.play(player)
		@slots_arr = ["Cherry", "BAR", "Sevens"]
		puts "--Welcome to the $5 Slots---
		Make a selection...
		1. Spin
		2. Cash Out and exit Slots"	
		user_input = gets.strip
		if user_input == "1"
			spin
			case reulsts
				when "jackpot"
					puts "JACKPOT!!!!!!"
					puts "You won $100"
					player.bank_roll += 100
				when "win"
					puts "You won $50"
					player.bank_roll += 50
				when "baby win"
					puts "You won $5"
					player.bank_roll += 5
				else 
					player.bank_roll -= 5
					puts "Spin again? (y/n)"
					get.strip == "y" ? Slots.play(player)
		elsif user_input == "2"
			
		else
			puts "Invalid input"
			Slots.play(player)
		end
	end

	def spin
		@spin_arr = []
		3.times { spin_arr << @slots_arr.sample }
		@spin_arr
	end

	def results
		if (@spin_arr[0] == @spin_arr[1] && @spin_arr[1] == @spin_arr[2])
			return "jackpot"
		elsif (@spin_arr[0] == @spin_arr[2])
			return "win"
		elsif (@spin_arr[0] == @spin_arr[1] || @spin_arr[1] == @spin_arr[2])
			return "baby win"
		end
	end

end
