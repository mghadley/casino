module Craps
	attr_accessor :player

	@cont = true
	
	def self.play(player)

		@roll_dice = Mechanics::Dice.roll
		bet = Mechanics::Bet.get_bet(player)
		@result = @roll_dice.inject(0){|sum, x| sum + x}
		puts "result of random generator #{@result}"

		if @result == 7 || @result == 11

			puts "PASS!"
			print "#{@roll_dice}\n"
			player.bank_roll += bet
			puts "your balance is $#{player.bank_roll}"
			puts "Play Again? (y/n)"
			input = gets.strip.downcase
			Craps.user_input(input, player)

		elsif @result == 2 || @result == 3 || @result == 12

			puts "CRAP OUT"
			print "#{@roll_dice}\n"
			player.bank_roll -= bet
			puts "your balance is $#{player.bank_roll}"
			puts "Play Again? (y/n)"
			input = gets.strip.downcase
			Craps.user_input(input, player)

		else
			print "#{@roll_dice}\n"
			puts "Play Again? (y/n)"
			input = gets.strip.downcase
			Craps.user_input(input, player)

		end

	end

	def self.user_input(input, player)
		if input == 'y'
				self.play(player)
			elsif input == 'n'
			  Craps.back_to_menu
			else
				puts "invalid input"
			end
	end

	def self.back_to_menu
		@cont = false
	end
end