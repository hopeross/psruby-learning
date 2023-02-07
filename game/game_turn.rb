require_relative 'die'
require_relative 'player'
module GameTurn
  def self.take_turn(player)
    die = Die.new
    number_rolled = die.roll
    puts player

    case number_rolled
      when 1..2
          player.blam
      when 3..4
          puts("Player was skipped!")
      when 5..6
          player.w00t
    end
  end
end