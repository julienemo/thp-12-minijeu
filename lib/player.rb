require "pry"

class Player
  attr_accessor :name
  attr_reader :life_point

  def initialize(name)
    @name = name
    @life_point = 10
    puts "Player #{name} created. Life point #{@life_point}"
  end

  def status
    puts "#{@name} has #{@life_point} life point(s)."
  end

end

binding.pry
