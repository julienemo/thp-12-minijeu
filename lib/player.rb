require "pry"

class Player
  attr_accessor :name
  attr_reader :life_point

  def initialize(name)
    @name = name
    @life_point = 10
    puts "Player #{name} created. Life point #{@life_point}"
  end

  def show_status
    puts "#{@name} has #{@life_point} life point(s)."
  end

  def attack(target)
    puts "#{@name} attacks #{target.name}."
    puts "#{target} gets #{computes_damage} damage."
    target.get_damage(computes_damage)
  end


  def gets_damage(damage_received)
    @life_points = @life_points - damage_received
    if @life_points <= 0
      puts "le joueur #{@name} a été tué !"
    end
  end

  private

  def computes_damage
    return rand(1..6)
  end


end

binding.pry
