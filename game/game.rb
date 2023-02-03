require_relative 'die'
class Game
  attr_reader :game_name
  def initialize(game_name)
    @game_name = game_name
    @players = []
  end

  def add_player(player)
    @players << player
  end

  def play
    puts "There are #{@players.length} players in #{game_name}\n\n"

    @players.each do |player|
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

      puts player
      puts ("\n")
    end
  end
end