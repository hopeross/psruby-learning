require_relative 'game'
require_relative 'player'

current_game = Game.new("Knuckleheads")
current_game.load_players(ARGV.shift || "game/players.csv")

loop do
  puts "How many game rounds? ('quit' to exit)"
  answer = gets.chomp.downcase
  case answer
  when /^\d+$/
    current_game.play(answer.to_i)
    current_game.print_stats
  when 'quit', 'exit'
    current_game.save_high_score("game/high_scores.csv")
    break
  else
    puts "Please enter a number or quit to exit"
  end
end