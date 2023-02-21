require_relative 'treasure_trove'
class Player
  attr_reader :player_health, :player_name
  # attr_writer :player_name

  def initialize(name, health=100)
    @player_name = name.capitalize
    @player_health = health
    @player_treasure = Hash.new(0)
  end

  def score
    @player_health + points
  end

  def points
    @player_treasure.values.reduce(0, :+)
  end

  def player_name=(new_name)
    @player_name = new_name.capitalize
  end

  def found_treasure(treasure)
    @player_treasure[treasure.name] += treasure.points
    puts "#{@player_name} found a #{treasure.name} worth #{treasure.points}"
    puts "#{@player_name}'s treasures: #{@player_treasure}'"
  end
  
  def strong?
    !(@player_health < 100)
  end
  def to_s
    "I'm #{@player_name} with a health = #{@player_health}, points = #{points}, score = #{score}"
  end

  def each_found_treasure
    @player_treasure.each do |name, points|
      yield Treasure.new(name, points)
    end
  end

  def <=> (other)
    other.score <=> score
  end
  def blam
    @player_health -= 10
    puts "#{@player_name} got blammed!"
  end

  def w00t
    @player_health += 15
    puts "#{@player_name} got w00ted!"
  end
end