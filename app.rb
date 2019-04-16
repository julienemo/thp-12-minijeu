#require_relative 'lib/game'
require_relative 'lib/player'
#require_relative 'lib/human_player'
require 'bundler'
Bundler.require


def start_game

  puts ""
  player1 = Player.new('Josiane')
  player2 = Player.new('José')

  while player1.life_points.positive? && player2.life_points.positive?
    puts '########################################'
    puts ""
    puts "Voici l'état de chaque joueur "
    player1.show_status
    player2.show_status
    puts ""
    puts '########################################'
    puts ""
    puts "Passons à la phase d'attaque "
    puts ""
    puts "-----Josiane attaque José-----"
    player1.attack(player2)
    break if player2.life_points <= 0
    puts "-----José ne va pas se laisser faire------"
    player2.attack(player1)
    puts ""
  end

   puts '########################################'
   puts ""
  if player1.life_points > player2.life_points
    puts "-----#{player2.name} gets killed.-----"
  	puts "     #{player1.name} a gangné le combat"
  else
    puts "-----#{player1.name} gets killed.-----"
  	puts "     #{player2.name} a gangné le combat-----"
  end
  puts ""

end

start_game
