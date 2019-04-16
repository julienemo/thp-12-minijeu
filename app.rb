require_relative 'lib/game'
require_relative 'lib/player'


julie = Player.new('julie@julie.com',10)
romain = Player.new('romain@romain.com', 10)
arthur = Player.new('arthur@arthur.com', 10)


puts "L'utilisateur #{julie.name} a #{julie.life_point} point de vie"

binding.pry
