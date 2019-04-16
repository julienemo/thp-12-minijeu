#require_relative 'lib/game'
require_relative 'lib/player'
#require_relative 'lib/human_player'
require 'bundler'
Bundler.require

# methode to create players and stock them in an array 
def create_players
  players_array = []
  puts ""
  player1 = Player.new('Josiane') # create a new player
  player2 = Player.new('José') ## create a new player
  players_array << player1 << player2
  return players_array
end

# methode to define the the game rules, players can attack and take damages
#it takes one argument (players_array)
def battle(players_array)
#loop end if one player is not alive
  while players_array[0].life_points.positive? && players_array[1].life_points.positive?
    puts '########################################'
    puts ""
    puts "Voici l'état de chaque joueur " 
    players_array[0].show_status 
    players_array[1].show_status
    puts ""
    puts '########################################'
    puts ""
    puts "Passons à la phase d'attaque "
    puts ""
    puts "-----Josiane attaque José-----"
    players_array[0].attack(players_array[1])
    break if players_array[1].life_points <= 0
    puts "-----José ne va pas se laisser faire------"
    players_array[1].attack(players_array[0])
    puts ""
  end
end
# methode to to display results it takes one argument (players_array)
def result(players_array)
   puts '########################################'
   puts ""
  if players_array[0].life_points > players_array[1].life_points
    puts "-----#{players_array[1].name} gets killed.-----"
  	puts "     #{players_array[0].name} a gangné le combat"
  else
    puts "-----#{players_array[0].name} gets killed.-----"
  	puts "     #{players_array[1].name} a gangné le combat-----"
  end
  puts ""
end
#methods to perform actions
def start_game
  players_array = create_players
  battle(players_array)
  result(players_array)
end


start_game
