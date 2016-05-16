module HighLow
	def self.play
		@deck = Deck.new
		@player_card = @deck.sample
		@deck.delete(@player_card)
		@dealer_card = @deck.sample
		puts "Your card is
					#{player_card.rank} of #{player_card.suit}"
		bet = Mechanics::Bet.get_bet
	end
end