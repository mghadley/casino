module Mechanics
	module Balance
		def self.check_balance(player)
			if player.bank_roll <= 0
				puts "You lost all your money. Get out!!!"
				exit 0
			end
		end
	end
end
