require_relative 'lib/game'
require_relative 'lib/player'
require_relative 'lib/human_player'
require 'bundler'
Bundler.require

player1 = Player.new('Josiane')
player2 = Player.new('José')

while player1.life_points.positive? && player2.life_points.positive?
  puts '########################################'
  puts "Voici l'état de chaque joueur "
  puts '########################################'
  puts player1.show_state
  puts '########################################'
  puts player2.show_state
  puts "Passons à la phase d'attaque "
  puts "Josiane attaque José"
  player1.attack(player2)
  break if player2.life_points <= 0
  puts "José ne va pas se laisser faire"
  player2.attack(player1)
end


binding.pry
