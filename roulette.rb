require 'pry'

module Roulette
	attr_accessor :player

	def self.wheel
		@b = %w(15 4 2 17 6 13 11 8 10 24 33 20 31 22 29 28 35 26).map {|n| n.colorize(:color => :black, :background => :white)}
		@r = %w(32 19 21 25 34 27 36 30 23 5 16 1 14 9 18 7 12 3).map { |n| n.colorize(:color => :red, :background => :white)}
		@g = ["0"].map { |n| n.colorize(:color => :green, :background => :white)}
		@possibilities = [@b, @r, @g]

		@wheel = """             #{@g[0]}
          #{@b[17]}   #{@r[0]}
        #{@r[17]}       #{@b[0]}
       #{@b[16]}         #{@r[1]}
      #{@r[16]}           #{@b[1]}
     #{@b[15]}              #{@r[2]}
    #{@r[15]}               #{@b[2]}
   #{@b[14]}                 #{@r[3]}
  #{@r[14]}                   #{@b[3]}
 #{@b[13]}                     #{@r[4]}
 #{@r[13]}                     #{@b[4]}
  #{@b[12]}                   #{@r[5]}
   #{@r[12]}                 #{@b[5]}
    #{@b[11]}               #{@r[6]}
     #{@r[11]}             #{@b[6]}
     	#{@b[10]}           #{@r[7]}
     	 #{@r[10]}         #{@b[7]}
     	   #{@b[9]}      #{@r[8]}
     	     #{@r[9]}  #{@b[8]}
 """.colorize(:background => :white)
	end

	def self.play(player)
		Roulette.wheel
		puts @wheel
		bet = Mechanics::Bet.get_bet(player)
		choice = Roulette.get_choice
		case choice
			when "1"
				result = Roulette.color
			when "2"
				result = Roulette.odd_even
			when "3"
				result = Roulette.number
			else
				puts "Invalid input"
				Roulette.get_choice
		end
		if result
			puts "You win!!".green
			player.bank_roll += bet
			Roulette.play_again?(player)
		else
			puts "You lose!!".red
			player.bank_roll -= bet
			Mechanics::Balance.check_balance(player)
			puts "Your bankroll is now #{player.bank_roll}"
			Roulette.play_again?(player)
		end
	end

	def self.get_choice
		puts "What would you like to bet on?"
		puts "1. Color"
		puts "2. Odd or Even"
		puts "3. Specific Number"
		input = gets.strip
	end

	def self.color
		puts "What color would you like to guess?"
		puts "1. Red"
		puts "2. Black"
		puts "3. Green"
		guess_hash = {"1" => @r, "2" => @b, "3" => @r}
		guess = gets.strip
		spin_result = @possibilities.sample
		binding.pry
		puts "Landed on #{spin_result.sample}"
		guess_hash[guess] == spin_result
	end

	def self.odd_even
		puts "What is your guess"
		puts "1. Odd"
		puts "2. Even"
		guess = gets.strip
		spin_result = @possibilities.sample.sample
		puts "Landed on #{spin_result}"
		if guess == "1"
			(spin_result.to_i % 2) != 0
		elsif guess == "2"
			(spin_result.to_i % 2) == 0
		else
			puts "Invalid input"
			Roulette.odd_even
		end
	end

	def self.number
		puts "Type the number you would like to guess"
		puts "It must be between 0 and 36"
		guess = gets.strip.to_i
		if guess.between?(0, 36)
			spin_result = @possibilities.sample.sample
			puts "The number is #{spin_result.to_i}"
			guess.to_i == spin_result.to_i
		else
			puts "Invalid input"
			Roulette.number
		end
	end

	def self.play_again?(player)
		puts "Would you like to spin again? (y/n)"
		answer = gets.strip.downcase
		if answer == "y"
			Roulette.play(player)
		elsif answer == "n"
			puts "Thank you for playing"
		else
			puts "Invalid input"
			Roulette.play_again?(player)
		end
	end

end