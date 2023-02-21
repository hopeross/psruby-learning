require_relative 'project'
require_relative 'fundrequest'
require_relative 'match_project'

pg1 = FundRequest.new("Test Group")
pg1.load_projects("project_list.csv")

sp = MatchProject.new("Match Project", 250, 1000, "01/01/2001")
pg1.add_project(sp)

loop do
  puts "\nHow many funding rounds? "
  answer = gets.chomp.downcase
  case answer
  when /^\d+$/
    pg1.request_funding(answer.to_i)
  when 'quit', 'exit'
    pg1.save_projects("funding_results.csv")
    break
  else
    puts "\nPlease enter a valid number or quit to exit"
  end

end

pg1.print_results