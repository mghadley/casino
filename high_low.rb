module HighLow
	def self.play(player)
		@deck = Mechanics::Deck.new
		@player_card = @deck.cards.sample
		@deck.cards.delete(@player_card)
		@dealer_card = @deck.cards.sample
		puts "Your card is:
					the #{@player_card.rank} of #{@player_card.suit}"
		bet = Mechanics::Bet.get_bet(player)
		puts "Is your card higher or lower than the dealer's?"
		case gets.strip.downcase
			when "lower"
				if @player_card.value < @dealer_card.value
					puts "The dealer's card is the #{@dealer_card.rank} of #{@dealer_card.suit}"
					puts "You win!!"
					player.bank_roll += bet
					puts "Your remaining bankroll is #{player.bank_roll}"
				else
					puts "The dealer's card is the #{@dealer_card.rank} of #{@dealer_card.suit}"
					puts "You lose!!"
					player.bank_roll -= bet
					puts "Your remaining bankroll is #{player.bank_roll}"
				end
			when "higher"
				if @player_card.value > @dealer_card.value
					puts "The dealer's card is the #{@dealer_card.rank} of #{@dealer_card.suit}"
					puts "You win!!"
					player.bank_roll += bet
					puts "Your remaining bankroll is #{player.bank_roll}"
				else
					puts "The dealer's card is the #{@dealer_card.rank} of #{@dealer_card.suit}"
					puts "You lose!!"
					player.bank_roll -= bet
					puts "Your remaining bankroll is #{player.bank_roll}"
				end
			end
	end
end