#TODO create main method
#player class
#slot machine module or class
#high low game module or class
require 'pry'

#TODO create main method
#player class
#slot machine module or class
#high low game module or class

Dir[File.dirname(__FILE__) + '/mechanics/*.rb'].each {|file| require file}

class Casino

	include Mechanics

	def game_menu

		Mechanics::Player.new
		puts "***** select game *****"
		puts "1. Slots"
		puts "2. High/Low"
		
	end

end

@player_game = Casino.new
@player_game.game_menu
