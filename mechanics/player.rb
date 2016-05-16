module Mechanics
	class Player

		attr_accessor :bank_roll

		def initialize
			@bank_roll = rand(20..100000)
			player_name
		end

		def player_name
			puts "Enter Name:"
			name = gets.strip
			puts "Welcome #{name}!"
			puts "Your intial bank roll is $#{@bank_roll}"
		end
	end
end

# player = Player.new