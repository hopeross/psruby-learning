require_relative 'die'
require_relative 'player'
require_relative 'treasure_trove'
module GameTurn
  def self.take_turn(player)
    puts player
    die = Die.new
    number_rolled = die.roll_d6

    case number_rolled
      when 1..2
          player.blam
      when 3..4
          puts("Player was skipped!")
      when 5..6
          player.w00t
    end

    treasure_found = TreasureTrove.random
    player.found_treasure(treasure_found)
  end
end