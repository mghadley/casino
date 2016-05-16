module Mechanics
	module Bet
		def self.get_bet(player)
			puts "How much would you like to bet?"
			bet = gets.strip.to_i
			if bet > player.bank_roll
				puts "You don't have that much money"
				get_bet
			elsif bet <= 0
				puts "That is not a valid bet"
				get_bet(player)
			else
				bet
			end
		end
	end
end