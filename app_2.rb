require_relative 'lib/game'
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

def continue?
  if (user.life_points <= 0)||((jose.life_point <= 0) && (jose.life_point <= 0))
    false
  else
    true
  end
end

def start_game
    welcome
    puts ""
    puts "Please give a name to yourself."
    print "> "
    ans = gets.chomp
    user = HumanPlayer.new(ans)
    puts ""
    puts "#{ans}, here are your two opponents :"
    print"---"
    jose = Player.new("Jose")
    print"---"
    josiane = Player.new("Josiane")


end
