#TODO create main method
#player class
#slot machine module or class
#high low game module or class
require 'pry'
require_relative 'high_low'
#TODO create main method
#player class
#slot machine module or class
#high low game module or class

Dir[File.dirname(__FILE__) + '/mechanics/*.rb'].each {|file| require file}

class Casino

	include Mechanics
	include HighLow

	def game_menu

		@player = Mechanics::Player.new

		while true
			puts "***** select game *****"
			puts "1. Slots"
			puts "2. High/Low"
			puts "3. Exit"

			case gets.strip
			when "1"

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
