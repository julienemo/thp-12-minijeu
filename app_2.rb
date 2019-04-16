require_relative 'lib/player'
require_relative 'lib/human_player'
require 'bundler'

Bundler.require

# every line in this file is almost in a method
# our coordinating method is start_game
# roll to the end to see

# welcome screen
def welcome
  puts "   -------------------------------------------------"
  puts "   |    Bienvenue sur 'ILS VEULENT TOUS MA POO' !  |"
  puts "   |Le but du jeu est d'être le dernier survivant !|"
  puts "   -------------------------------------------------"
end

# here we ask the user to give a luck name for his or herself
def create_human
  puts "Please give a name to yourself."
  print "> "
  ans = gets.chomp
  user = HumanPlayer.new(ans)
  puts ""
  puts "#{ans}, here are your two opponents :"
  return user
end

# here we iterate through an array of names to create the bad guys
# we then put the players (not the names) into an array that we can use afterwards
def create_opponent(array_opponents)
  players_array = []
  array_opponents.each do |opponent|
    player = Player.new(opponent)
    players_array << player
  end
  return players_array
end

# there there is a while, there is a condition
# here is our condition to continue the game
# if the user is alive
# or if the bad guys are not all dead
def continue?(user, opponents)
  if  (user.life_points > 0) && ((opponents[0].life_points > 0) || (opponents[1].life_points > 0))
    true
  else
    false
  end
end

# at each round we propose the user to choose from a list of options
# this is merely the list
# nothing more
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

# this is where we get the answer to the list
# and do stuff accrodingly
# this method is long and we are aware
# we could certainly have optimized but we ran out of time
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

# here is the whole heart of the game
# the loop, the choice, the action and the result
def battle(user, opponents)
  while continue?(user, opponents)
    puts "------------------------"
    choices(opponents)
    action(user, opponents)
  end
  # this is the result part
  puts "------------------------"
  puts ""
  if user.life_points > 0
    puts "Congrats ! You won !"
  else
    puts "Sorry, your opponents are too strong. You died...."
  end
  puts ""
end

# and now I present:
# the start_game method, that takes an array of names we want to give to the bad guys
def start_game(array_opponents)
  welcome
  user = create_human
  opponents = create_opponent(array_opponents)
  battle(user, opponents)
end



start_game(['julie', 'dhiya'])
