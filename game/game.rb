require_relative 'die'
require_relative 'game_turn'
require_relative 'treasure_trove'
class Game
  attr_reader :game_name
  def initialize(game_name)
    @game_name = game_name
    @players = []
  end

  def add_player(player)
    @players << player
  end

  def load_players(from_file)
    File.readlines(from_file).each do |line|
      name, health = line.split(',')
      player = Player.new(name.chomp, Integer(health.chomp))
      add_player(player)
    end
  end

  def format_player(player)
    formatted_name = player.player_name.ljust(20, '.')
    "#{formatted_name} #{player.score}"
  end

  def save_high_score(to_file)
    File.open(to_file, "w") do |file|
      file.puts "#{game_name} High Scores"

      sorted_players = @players.sort

      sorted_players.each do | player |
        file.puts "#{format_player(player)}"
      end
    end
  end

  def print_name_and_health(player)
    puts "#{player.player_name} (#{player.player_health})"
  end

  def total_points
      @players.reduce(0) { |sum, player| sum + player.points }
  end
  def print_stats
    strong, whimpy = @players.partition { |p| p.strong?}

    puts "\nThere are #{strong.size} Strong Players: \n"
    strong.each do |player|
      print_name_and_health(player)
    end

    puts "\nThere are #{whimpy.size} Whimpy Players: \n"
    whimpy.each do |player|
      print_name_and_health(player)
    end

    sorted_players = @players.sort

    puts "\nIndividual grand totals"
    sorted_players.each do |player|
      puts "\n#{player.player_name}'s point totals: "
      player.each_found_treasure do |treasure|
        puts "#{treasure.name}: #{treasure.points} points"
      end
      puts "\nFor a grand total of: #{player.points}"
    end

    puts "\n#{@game_name} High Scores"

    top_players = sorted_players.first(3)
    top_players.each do |player|
      puts "#{format_player(player)}"
    end

    puts "\nTotal points accumulated this game: #{total_points}"
  end

  def play(rounds)
    puts "There are #{@players.length} players in #{game_name}\n\n"
    @players.each do |player|
      puts player
    end

    treasures = TreasureTrove::TREASURES
    puts "\nThere are #{treasures.size} treasures to be found!"
    treasures.each do |treasure|
      puts "A #{treasure.name} is worth #{treasure.points} points"
    end

    1.upto(rounds) do |round|
      puts "Starting round: #{round} of #{rounds}"

      if block_given?
        break if yield
      end

      puts("\nRound: #{round}\n\n")
      @players.each do |player |
        GameTurn.take_turn(player)
        puts ("\n")
      end
    end

    puts "\nHere are the results!"
  end
end