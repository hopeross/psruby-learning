require_relative 'game'
require_relative 'player'
require_relative 'die'

die = Die.new
number_rounds = die.roll_d10

player1 = Player.new("moe", 100)
player2 = Player.new("larry", 60)
player3 = Player.new("curley", 125)
player4 = Player.new("shemp")
player5 = Player.new("Joe", 55)
player6 = Player.new("Rock", 200)
player7 = Player.new("Al", 30)
player8 = Player.new("alvin", 15)
player9 = Player.new("simon", 30)
player10 = Player.new("theodore", 45)

current_game = Game.new("Knuckleheads")
current_game.add_player(player1)
current_game.add_player(player2)
current_game.add_player(player3)
current_game.add_player(player4)
current_game.add_player(player5)
current_game.add_player(player6)
current_game.add_player(player7)
current_game.add_player(player8)
current_game.add_player(player9)
current_game.add_player(player10)
current_game.play(number_rounds)

current_game.print_stats

