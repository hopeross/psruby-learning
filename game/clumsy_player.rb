require_relative 'player'
class ClumsyPlayer < Player
  def initialize(name, health)
    super(name, health)
    @boost_factor = 5
  end

  def found_treasure(treasure)
    damaged_treasure = Treasure.new(treasure.name, treasure.points/2.0)
    super(damaged_treasure)
  end

  def w00t
    @boost_factor.times { super }
  end
end