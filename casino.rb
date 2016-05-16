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

		Mechanics::Player.new
		puts "***** select game *****"
		puts "1. Slots"
		puts "2. High/Low"

		case gets.strip
		when "1"

		when "2"
			HighLow.play

		else
		end
		
	end

end

@player_game = Casino.new
@player_game.game_menu
