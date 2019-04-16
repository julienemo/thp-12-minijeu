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

<<<<<<< HEAD
  # CLASS METHOD
  def self.all
    return @@all
=======
  def search_health_pack
    r_number = rand(1..6)
    if r_number = 1
      puts "You did not find anything... "
    elsif [2..5].include?r_number
    	@life_points += 50
    	@life_points = 100 if @life_points > 100
    	puts 'Bravo, you found a pack of +50 life points !'
    else
    	@life_points += 80
    	@life_points = 100 if @life_points > 100
    	puts 'Waow,  you found a pack of +80 life points !'
    end
>>>>>>> 439719d75f4ce2e586a815773031abdaae21f14f
  end

  private

  def computes_damage
    rand(1..6) * @weapon_level
  end

  def rand_weapon
    rand(1..6)
  end
end
