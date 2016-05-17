#TODO create main method
#player class
#slot machine module or class
#high low game module or class
require 'pry'
require_relative 'high_low'
require_relative 'slots'
#TODO create main method
#player class
#slot machine module or class
#high low game module or class

Dir[File.dirname(__FILE__) + '/mechanics/*.rb'].each {|file| require file}

class Casino

	include Mechanics
	include HighLow
	include Slots

	def game_menu

		@player = Mechanics::Player.new

		while true
			puts "***** select game *****"
			puts "1. Slots"
			puts "2. High/Low"
			puts "3. Exit"

			case gets.strip
			when "1"
				if @player.bank_roll > 4
					puts "--Welcome to the $5 Slots---"
					Slots.play(@player)
				else
					puts "Your current bankroll is $#{player.bank_roll}"
					puts "You do not have enough money for slots. Maybe try High Low"
				end
			when "2"
				HighLow.play(@player)

			when "3"
				puts "Are you sure you want to exit? (y/n)"
				input = gets.strip.downcase
				 if input == 'y'
				 	exit
				 elsif input == 'n'
				 	puts "Good choice"
				 else
				 	puts "invalid input try again!"
				 end
			else
			end
		end
		
	end

end

@player_game = Casino.new
@player_game.game_menu


