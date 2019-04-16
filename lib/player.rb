require "pry"

class Player
  attr_accessor :name
  attr_reader :life_point

  def initialize(name)
    @name = name
    @life_point = 40
    puts "Player #{name} created. Life point #{@life_point}"
  end

  def show_status
    puts "#{@name} has #{@life_point} life point(s)."
  end

  def attack(target)
    strike = computes_damage
    puts "#{@name} attacks #{target.name}."
    puts "#{target.name} gets #{strike} damage."
    target.gets_damage(strike)
  end

  def gets_damage(damage_received)
    @life_point = @life_point - damage_received
    if @life_point <= 0
      @life_point = 0
      return "Player #{@name} game over !"
    end
  end

  private

  def computes_damage
    return rand(1..6)
  end



end

binding.pry
