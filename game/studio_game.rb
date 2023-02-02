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

  def to_s
    "I'm #{@player_name} with a health of #{@player_health} and a score of #{score}"
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

player1 = Player.new("moe", 100)
player2 = Player.new("larry", 60)
player3 = Player.new("curley", 125)

current_game = Game.new("Knuckleheads")
current_game.add_player(player1)
current_game.add_player(player2)
current_game.add_player(player3)
current_game.play

player4 = Player.new("alvin", 15)
player5 = Player.new("simon", 30)
player6 = Player.new("theodore", 45)

current_game = Game.new("Chipmunks")
current_game.add_player(player4)
current_game.add_player(player5)
current_game.add_player(player6)
current_game.play

