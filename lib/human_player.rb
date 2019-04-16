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
end
