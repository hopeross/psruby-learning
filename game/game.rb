class Game
  attr_reader :game_name
  def initialize(game_name)
    @game_name = game_name
    @players = []
  end

  def add_player(player)
    @players << player
  end

  def play()
    puts "There are #{@players.length} players in #{game_name}\n\n"
    @players.each do |player|
      puts player
      puts player.blam
      puts player.blam
      puts player.blam
      puts player.w00t
      puts player.blam
      puts player.w00t
      puts player
      puts ("\n")
    end
  end
end