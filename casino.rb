#TODO create main method
#player class
#slot machine module or class
#high low game module or class
require 'pry'
require_relative 'high_low'
require_relative 'slots'
require_relative 'roulette'
#TODO create main method
#player class
#slot machine module or class
#high low game module or class

Dir[File.dirname(__FILE__) + '/mechanics/*.rb'].each {|file| require file}

class Casino

	include Mechanics
	include HighLow
	include Slots
	include Roulette

	def game_menu

		player = Mechanics::Player.new
		@multi_player = []
		@current_player = player
		@multi_player << @current_player.name
		@helper_arr = []
		@helper_arr << @current_player
		# @multi_player[@count] = @player.name

		while true
			puts "***** select game *****".colorize(:color => :black, :background => :light_blue)
			puts "1. Slots".colorize(:color => :white, :background => :blue)
			puts "2. High/Low".colorize(:color => :white, :background => :blue)
			puts "3. Roulette".colorize(:color => :white, :background => :blue)
			puts "4. Add New player".colorize(:color => :white, :background => :blue)
			puts "5. Switch Player".colorize(:color => :white, :background => :blue)
			puts "6. Exit".colorize(:color => :white, :background => :blue)

			case gets.strip
			when "1"
				if @current_player.bank_roll > 4
					puts "--Welcome to the $5 Slots---"
					Slots.play(@current_player)
				else
					puts "Your current bankroll is $#{player.bank_roll}"
					puts "You do not have enough money for slots. Maybe try High Low"
				end

			when "2"
				HighLow.play(@current_player)

			when "3"
				Roulette.play(@current_player)

			when "4"
				new_player = Mechanics::Player.new
				@multi_player << new_player.name
				@current_player = new_player
				@helper_arr << @current_player

			when "5"
				puts @multi_player
				puts "Enter new player name: "
				name = gets.strip
				if @multi_player.include?(name) == true
					puts "yes"
					get_index = @multi_player.index(name)
					@current_player = @helper_arr[get_index]
					puts "#{@current_player.name} your bank roll is $#{@current_player.bank_roll}"
					# set current player to new player
				end

			when "6"
				puts "Are you sure you want to exit? (y/n)"
				input = gets.strip.downcase
				 if input == 'y'
				 	puts "Play again soon!"
				 	exit
				 elsif input == 'n'
				 	puts "Good choice"
				 else
				 	puts "invalid input try again!"
				 end
			else
				puts "incorrect entry, Try again"
			end
		end
		
	end

end

@player_game = Casino.new
@player_game.game_menu


