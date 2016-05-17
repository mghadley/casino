module Roulette
	def self.wheele
		@b = %w(15 4 2 17 6 13 11 8 10 24 33 20 31 22 29 28 35 26).map {|n| n.colorize(:background => :white)}
		@r = %w(32 19 21 25 34 27 36 30 23 5 16 1 14 9 18 7 12 3).map { |n| n.colorize(:color => :red, :background => :white)}
		@g = "0".colorize(:color => :green, :background => :white)

		@wheel = "            @g            "
"          @b[17]   @r[0]            "
"        @r[17]       @b[0]          "
"       @b[16]         @r[1]         "
"      @r[16]           @b[1]        "
"     @b[15]             @r[2]       "
"    @r[15]               @b[2]      "
"   @b[14]                 @r[3]     ".colorize(:background => :white)
"  @r[14]                   @b[3]    "
" @b[13]                     @r[4]   "
" @r[13                      @b[4]   "
	end
end