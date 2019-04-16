require_relative 'lib/game'
require_relative 'lib/player'
require_relative 'lib/human_player'


julie = Player.new('julie@julie.com')
romain = Player.new('romain@romain.com')
arthur = Player.new('arthur@arthur.com', 10)


puts "L'utilisateur #{julie.name} a #{julie.life_point} point de vie"

binding.pry
