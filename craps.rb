module Craps

	attr_accessor :player

	@cont = true
	@count = 0
	
	def self.play(player)

		@roll_dice = Mechanics::Dice.roll
		bet = Mechanics::Bet.get_bet(player)
		@result = @roll_dice.inject(0){|sum, x| sum + x}
		puts "Dice rolled - #{@result}"

		if @result == 7 || @result == 11
			puts "PASS!"
			print "#{@roll_dice}\n"
			player.bank_roll += bet
			puts "your balance is $#{player.bank_roll}"
			Craps.user_input(player)

		elsif @result == 2 || @result == 3 || @result == 12

			puts "CRAP OUT"
			print "#{@roll_dice}\n"
			player.bank_roll -= bet
			puts "your balance is $#{player.bank_roll}"
			Craps.user_input(player)

		else
			puts "Try again "
			print "#{@roll_dice}\n"		
			Craps.user_input(player)

		end

	end

	def self.user_input(player)
		
		puts "What would you like to do?"
				puts "1. Play again"
				puts "2. Cash out"
				input = gets.strip
		    if input == '1'
				self.play(player)
			elsif input == '2'
			puts "Your current bankroll is #{player.bank_roll}"
			  Craps.back_to_menu
			else
				puts "invalid input"
				user_input(player)
			end
	end

	def self.back_to_menu
		@cont = false
	end
end