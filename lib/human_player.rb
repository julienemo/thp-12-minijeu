require_relative "player"
require "pry"

class HumanPlayer < Player
  attr_accessor :name, :weapon_lever
  attr_reader :life_point

  def initialize(name)
    @name = name
    @life_point = 100
    @weapon_level = 1
  end

  def show_status
    puts "#{@name} has #{@life_point} life point(s) and a weapon of level #{@weapon_level}."
  end

  def search_weapon
    level = rand_weapon
    puts "You've found a weapon of level #{level}."
    if level > @weapon_level
      puts "It is more powerful than your actual weapon. You're now level #{level}."
      @weapon_lever = level
    else
      puts "F@*#$...You may just as well keep what you have now... "
    end

  end

  private

  def compute_damage
    rand(1..6) * @weapon_level
  end

  def rand_weapon
    rand(1..6)
  end
end
