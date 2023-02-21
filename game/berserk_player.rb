require_relative 'player'

class BerserkPlayer < Player
  def initialize(name, health=100)
    super(name, health)
    @w00t_count = 0
  end

  def berserk?
    @w00t_count > 5
  end

  def w00t
    super
    @w00t_count += 1
    if berserk?
      puts "#{@player_name} is berserk!"
    end
  end

  def blam
    if berserk?
      w00t
    else
      super
    end
  end
end