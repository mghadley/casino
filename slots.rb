module Slots
	attr_accessor :player
	
	def self.play(player)
		@cont = true
		@slots_arr = ["BAR", "☃", "☺", "❤", "✄", "⌘", "7"]
		puts "Press Enter to spin, type exit to cancel"
		user_input = gets
		if user_input == "\n"
			Slots.spin
			case Slots.results
				when "jackpot"
					puts "JACKPOT!!!!!!".green
					puts "You won $100"
					player.bank_roll += 100
				when "win"
					puts "You won $50".green
					player.bank_roll += 50
				when "baby win"
					puts "You won $5".green
					player.bank_roll += 5
				else 
					puts "You lossssttttt".red
					player.bank_roll -= 5
					Mechanics::Balance.check_balance(player)
					puts "Your bankroll is now #{player.bank_roll}"
			end
			Slots.play_again?(player)
		elsif user_input.strip == "exit"
			puts "Your current bankroll is $#{player.bank_roll}"
			puts "Goodbye"
		else
			puts "Invalid input"
			Slots.play(player)
		end
	end

	def self.spin
		@spin_arr = []
		3.times { @spin_arr << @slots_arr.sample }
		@spin_arr
		puts "#{@spin_arr[0]} | #{@spin_arr[1]} | #{@spin_arr[2]}".blue
	end

	def self.results
		if (@spin_arr[0] == @spin_arr[1] && @spin_arr[1] == @spin_arr[2])
			return "jackpot"
		elsif (@spin_arr[0] == @spin_arr[2])
			return "win"
		elsif (@spin_arr[0] == @spin_arr[1] || @spin_arr[1] == @spin_arr[2])
			return "baby win"
		end
	end

	def self.play_again?(player)
		if player.bank_roll > 4
			puts "Spin again? (y/n)"
			gets.strip == "y" ? Slots.play(player) : @cont = false
		else
			puts "Your current bank roll is #{player.bank_roll}"
			puts "You don't have enough money to continue with slots. Maybe try High Low."
		end
	end

end
