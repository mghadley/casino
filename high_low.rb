module HighLow
	attr_accessor :player 
	
	def self.play(player)
		@cont = true
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
					Mechanics::Balance.check_balance(player)
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
					Mechanics::Balance.check_balance(player)
					puts "Your remaining bankroll is #{player.bank_roll}"
				end
		end
		HighLow.continue?(player)
	end

	def self.continue?(player)
		puts "What would you like to do"
		puts "1. Play again"
		puts "2. Cash out"
		input = gets.strip
		if input == "1"
			HighLow.play(player)
		elsif input == "2"
			puts "Your current bankroll is #{player.bank_roll}"
			HighLow.back_to_menu
		else
			puts "That is not valid input"
			HighLow.continue?(player)
		end
	end

	def self.back_to_menu
		@cont = false
	end
end

