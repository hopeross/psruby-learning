require_relative 'game'
require_relative 'player'

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

