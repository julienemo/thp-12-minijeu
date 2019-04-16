require_relative "player"
require "pry"

class HumanPlayer < Player
  attr_accessor :name, :weapon_level
  attr_reader :life_points
  @@all = []

  # INSTANCE METHODS
  def initialize(name)
    @life_points = 100
    @weapon_level = 1
    @name = name
    puts "Human player #{name} created. Life points #{@life_points}, weapon lever #{@weapon_level}."
    @@all << self
  end

  def show_status
    puts "#{@name} has #{@life_points} life point(s) and a weapon of level #{@weapon_level}."
  end

  def search_weapon
    level = rand_weapon
    puts "You've found a weapon of level #{level}."
    if level > @weapon_level
      @weapon_level = level
      puts "Keep it! You're now level #{@weapon_level}!"
    else
      puts "F@*#$...You may just as well keep what you have now... "
    end
  end

  # CLASS METHOD
  def self.all
    return @@all
  end

  private

  def computes_damage
    rand(1..6) * @weapon_level
  end

  def rand_weapon
    rand(1..6)
  end
end
