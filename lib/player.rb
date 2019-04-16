require "pry"

class Player
  # we want to be able to modify and read the name
  # but the life_points shouldn't be modified by user
  attr_accessor :name
  attr_reader :life_points

  def initialize(name)
    @name = name
    @life_points = 10
    # merely a confirmation
    puts "Player #{name} created. Life points #{@life_points}"
  end

  def show_status
    # there are spaces for later mise en page reason
    puts "     #{@name}: #{@life_points} point(s)."
  end

  # although attack is a public method, it uses several private method
  def attack(target)
    # computes_damage is a private method
    # it generates a random number (see lower)
    # we can't call the method more than once for coherent reason
    # but we need to use its value more than once
    # so we call it, store its value in a var
    strike = computes_damage
    puts ""
    puts "     #{@name} attacks #{target.name} with force #{strike}."
    if target.life_points > strike
      puts "     #{target.name} gets #{strike} damages."
    # coz we wouldn't want print something like "A has 10 life points and recieve 24 stikes"
    # we want to see 'A is striked to death'
    else
      puts "     #{target.name} gets killed."
    end
    target.gets_damage(strike)
    puts ""
  end

  # this method is publicm, coz we'll need to call it for a user
  # it needs to be an instance method
  # but we find it shouldn't be accessible for a user and wanted to make it private
  # however given it will be unsable as private
  # we leave it public
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
