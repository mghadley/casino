#TODO create main method
#player class
#slot machine module or class
#high low game module or class
require 'pry'

Dir[File.dirname(__FILE__) + '/mechanics/*.rb'].each {|file| require file}

deck = Mechanics::Deck.new
binding.pry
puts deck