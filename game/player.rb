class Player
  attr_reader :player_health, :player_name
  # attr_writer :player_name

  def initialize(name, health=100)
    @player_name = name.capitalize
    @player_health = health
  end

  def score
    @player_health + @player_name.length
  end

  def player_name=(new_name)
    @player_name = new_name.capitalize
  end

  def strong?
    if @player_health < 100
      false
    else
      true
    end
  end
  def to_s
    "I'm #{@player_name} with a health of #{@player_health} and a score of #{score}"
  end

  def <=> (other)
    other.score <=> score
  end
  def blam
    @player_health -= 10
    "#{@player_name} got blammed!"
  end

  def w00t
    @player_health += 15
    "#{@player_name} got w00ted!"
  end
end