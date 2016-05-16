module HighLow
	def play
		@deck = Deck.new
		@player_card = @deck.sample
		@deck.delete(@player_card)
		@dealer_card = @deck.sample
		puts "Your card is:
					the #{player_card.rank} of #{player_card.suit}"
		bet = Mechanics::Bet.get_bet
		puts "Is your card higher or lower than the dealer's?"
		case gets.strip.downcase
			when "lower"
				if @player_card.value < @dealer_card.value
					puts "The dealer's card is the #{@dealer_card.rank} of #{@dealer_card.suit}"
					puts "You win!!"
					@player.bank_roll += bet
				else
					puts "The dealer's card is the #{@dealer_card.rank} of #{@dealer_card.suit}"
					puts "You lose!!"
					@player.bank_roll -= bet
				end
			when "higher"
				if @player_card.value > @dealer_card.value
					puts "The dealer's card is the #{@dealer_card.rank} of #{@dealer_card.suit}"
					puts "You win!!"
					@player.bank_roll += bet
				else
					puts "The dealer's card is the #{@dealer_card.rank} of #{@dealer_card.suit}"
					puts "You lose!!"
					@player.bank_roll -= bet
				end
			end
	end
end