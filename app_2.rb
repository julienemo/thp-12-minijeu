#require_relative 'lib/game'
require_relative 'lib/player'
require_relative 'lib/human_player'
require 'bundler'

Bundler.require

def welcome
  puts "   -------------------------------------------------"
  puts "   |    Bienvenue sur 'ILS VEULENT TOUS MA POO' !  |"
  puts "   |Le but du jeu est d'être le dernier survivant !|"
  puts "   -------------------------------------------------"
end

def create_human
  puts "Please give a name to yourself."
  print "> "
  ans = gets.chomp
  user = HumanPlayer.new(ans)
  puts ""
  puts "#{ans}, here are your two opponents :"
  return user
end

def create_opponent(array_opponents)
  players_array = []
  array_opponents.each do |opponent|
    player = Player.new(opponent)
    players_array << player
  end
  return players_array
end

def continue?(user, opponents)
  if  (user.life_points > 0) && ((opponents[0].life_points > 0) || (opponents[1].life_points > 0))
    true
  else
    false
  end
end

def choices(opponents)
  puts "Here are your options :"
  puts ""
  puts "a - Look for another weapon"
  puts "s - Look for a life pack"
  puts ""
  puts "Or, attack one of the surviving opponents"
  opponents.each_with_index do |opponent, i|
    if opponent.life_points > 0
      puts "#{i} - #{opponent.name} with #{opponent.life_points} points."
    end
  end
end

def battle(user, opponents)
  while continue?(user, opponents)
    puts "------------------------"
    choices(opponents)
    action(user, opponents)
  end
  puts "------------------------"
  puts ""
  if user.life_points > 0
    puts "Congrats ! You won !"
  else
    puts "Sorry, your opponents are too strong. You died...."
  end  
  puts ""
end

def action(user, opponents)
  print "> "
  choice = gets.chomp
  puts "------------------------"
  case choice
  when "a"
    user.search_weapon
    puts ""
  when "s"
    user.search_health_pack
  when "0"
    puts "User attacks"
    user.attack(opponents[0])
  when "1"
    puts "User attacks"
    user.attack(opponents[1])
  end 
  puts "Opponents attack"
  opponents.each do |opponent|
    if opponent.life_points > 0
       opponent.attack(user)
    end   
  end 
  puts "------------------------"
  puts "This is where you guys are :"
  puts ""
  user.show_status
  opponents.each do |opponent|
    opponent.show_status
  end
end


def start_game(array_opponents)
  welcome
  user = create_human
  opponents = create_opponent(array_opponents)
  battle(user, opponents)
end



start_game(['julie', 'dhiya'])
