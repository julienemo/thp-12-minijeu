require "pry"

class Player
  attr_accessor :name
  attr_reader :life_points

  def initialize(name)
    @name = name
    @life_points = 10
    puts "Player #{name} created. Life points #{@life_points}"
  end

  def show_status
    puts "     #{@name}: #{@life_points} point(s)."
  end

  def attack(target)
    strike = computes_damage
    puts ""
    puts "     #{@name} attacks #{target.name} with force #{strike}."
    if target.life_points > strike
      puts "     #{target.name} gets #{strike} damages."
    else
      puts "     #{target.name} gets killed."
    end
    target.gets_damage(strike)
    puts ""
  end

  def gets_damage(damage_received)
    @life_points = @life_points - damage_received
    if @life_points <= 0
      @life_points = 0
      return "Player #{@name} game over !"
    end
  end

  private

  def computes_damage
    return rand(1..6)
  end



end
