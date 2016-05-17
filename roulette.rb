require 'pry'

module Roulette
	attr_accessor :player

	def self.wheel
		@b = [15, 4, 2, 17, 6, 13, 11, 8, 10, 24, 33, 20, 31, 22, 29, 28, 35, 26]
		@r = [32, 19, 21, 25, 34, 27, 36, 30, 23, 5, 16, 1, 14, 9, 18, 7, 12, 3]
		@g = [0]
		@wb = %w(15 4 2 17 6 13 8 10 24 33 20 31 22 29 28 35 26).map {|n| n.colorize(:color => :black, :background => :white)}
		@wr = %w(32 29 21 25 34 27 36 30 23 5 16 1 14 9 18 7 12 3).map { |n| n.colorize(:color => :red, :background => :white)}
		@wg = %w(0).map { |n| n.colorize(:color => :green, :background => :white)}
		@possibilities = [@b, @b, @b, @b, @b, @b, @b, @b, @b, @b, @b, @b, @b, @b, @b, @b, @b, @b,
			                @r, @r, @r, @r, @r, @r, @r, @r, @r, @r, @r, @r, @r, @r, @r, @r, @r, @r, @g]
		# @possibilities = [@g] #used for forcing win

		@wheel = """                           
		            #{@wg[0]}
                       #{@wb[17]}       #{@wr[0]}         
                 #{@wr[17]}                   #{@wb[0]}          
             #{@wb[16]}                           #{@wr[1]}          
         #{@wr[16]}                                  #{@wb[1]}            
      #{@wb[15]}                                       #{@wr[2]}        
    #{@wr[15]}                                            #{@wb[2]}     
   #{@wb[14]}                                              #{@wr[3]}      
  #{@wr[14]}                                                #{@wb[3]}      
 #{@wb[13]}                                                  #{@wr[4]} 
 #{@wr[13]}                                                 #{@wb[4]}
  #{@wb[12]}                                              #{@wr[5]}
   #{@wr[12]}                                            #{@wb[5]}
    #{@wb[11]}                                        #{@wr[6]}
     #{@wr[11]}                                   #{@wb[6]}
     	 #{@wb[10]}                             #{@wr[7]}
     	    #{@wr[10]}                     #{@wb[7]}
     	         #{@wb[9]}            #{@wr[8]}
     	              #{@wr[9]} #{@wb[8]}
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
				multiplier = 1
			when "2"
				result = Roulette.odd_even
				multiplier = 1
			when "3"
				result = Roulette.number
				multiplier = 35
			else
				puts "Invalid input"
				Roulette.play(player)
		end
		if result
			puts "You win!!".green
			puts "You win $#{bet * multiplier}"
			player.bank_roll += bet * multiplier
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
		puts "Landed on #{spin_result.sample}"
		return guess_hash[guess] == spin_result
	end

	def self.odd_even
		puts "What is your guess"
		puts "1. Odd"
		puts "2. Even"
		guess = gets.strip
		spin_result = @possibilities.sample.sample
		puts "Landed on #{spin_result}"
		if guess == "1"
			return (spin_result % 2) != 0
		elsif guess == "2"
			return (spin_result % 2) == 0
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
			puts "The number is #{spin_result}"
			return guess == spin_result
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