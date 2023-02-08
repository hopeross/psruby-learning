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

  def print_name_and_health(player)
    puts ("#{player.player_name} (#{player.player_health})")
  end
  def print_stats
    strong, whimpy = @players.partition { |p| p.strong?}

    puts ("\nThere are #{strong.size} Strong Players: \n")
    strong.each do |player|
      print_name_and_health(player)
    end

    puts ("\nThere are #{whimpy.size} Whimpy Players: \n")
    whimpy.each do |player|
      print_name_and_health(player)
    end

    puts ("\n#{@game_name} High Scores")
    sorted_players = @players.sort
    top_players = sorted_players.first(3)
    top_players.each do |player|
      formatted_name = player.player_name.ljust(20, '.')
      puts "#{formatted_name} #{player.score}"
    end
  end

  def play(rounds)
    puts "There are #{@players.length} players in #{game_name}\n\n"

    1.upto(rounds) do |round|
      puts("\nRound: #{round}\n\n")
      @players.each do |player |
        GameTurn.take_turn(player)
        puts player
        puts ("\n")
      end
    end

    puts "\nAfter #{rounds} rounds, here are the results!"
  end
end