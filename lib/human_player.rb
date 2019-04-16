require_relative "player"
require "pry"

class HumanPlayer < Player
  #HumanPlayer is an inheritance class in which you can find part of methods from the Player class
  attr_accessor :name, :weapon_level
  attr_reader :life_points

  # 3 variables in this class : name/weapon_level/life_points

  # INSTANCE METHODS
  def initialize(name)
  #here we define the initailize method which gets the same attributes as the initialize method in the Player class
  #however, life_points has been upgraded to 100 points and we added the possibility to make more damages through @weapon_level
    @life_points = 100
    @weapon_level = 1
    @name = name
    puts "Human player #{name} created. Life points #{@life_points}, weapon lever #{@weapon_level}."
  end

  def show_status
  #method which provides, at a given round, the name of the user and his number of life points at this choosen time
    puts "     #{@name} has #{@life_points} life point(s) and a weapon of level #{@weapon_level}."
  end

  def search_weapon
  #this method enables the user to get a new weapon if the damages caused by this weapon > damages of the old weapon.
    level = rand_weapon
  #the level of the new weapons i randomly choose (cf. rand_weapon)
    puts "You've found a weapon of level #{level}."
    if level > @weapon_level
      @weapon_level = level
      puts "Keep it! You're now level #{@weapon_level}!"
    else
      puts "F@*#$...You may just as well keep what you have now... "
    end
  #conditions to know we keep the old or the new weapon
  end


  def search_health_pack
  #new features that enables to increase life points.
    r_number = rand(1..6)
  #randomly determined (cf. computes_damage)
    if r_number == 1
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
  #3 cases : you can get 0, 50, or 80 life points with this feature
  #it depends the value of the random generator 
  #1 => no life points added
  #between 2 and 5 => you got 50 life points back
  #6 => you got 80 life points back
  end

  private
#private method 
  def computes_damage
#return the damages provided by the new weapon
#and will be used in the method action from app_2.rb 
    rand(1..6) * @weapon_level
  end

  def rand_weapon
    rand(1..6)
  end

end