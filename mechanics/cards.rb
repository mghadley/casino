module Mechanics
	class Card
		attr_accessor :suit, :rank, :value, :color
		def initialize(suit, rank)
			@suit = suit
			@rank = rank
			@value = assign_value
			@color = (suit == "Hearts" || suit == "Diamonds") ? "Red" : "Black"
		end

		def assign_value
			case @rank
				when "A"
					value = 14
				when "K"
					value = 13
				when "Q"
					value = 12
				when "J"
					value = 11
				else
					value = @rank.to_i
			end
		end
	end
	

	class Deck
		attr_accessor :card

		def initialize
			@suits = %w(Diamonds Hearts Clubs Spades)
			@ranks = %w(A 2 3 4 5 6 7 8 9 10 J Q K)
			@cards = []
			generate_deck
		end

		def generate_deck
			@suits.each do |s|
				@ranks.each do |r|
					@cards << Card.new(s, r)
				end
			end
		end
	end
end
