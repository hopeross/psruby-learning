require_relative 'die'
require_relative 'game_turn'
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

    @players.each do |player |
      GameTurn.take_turn(player)
      puts player
      puts ("\n")
    end
  end
end