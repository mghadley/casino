#roll dice
module Mechanics
	module Dice

		def self.roll
			die = []
			#random dice between 1 & 6 and some 
			#rand(1..6)
			#rand(6) + 1

			die << rand(1..6) << rand(1..6)
			
		end

	end
end