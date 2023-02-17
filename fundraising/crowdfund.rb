require_relative 'project'
require_relative 'fundrequest'

pg1 = FundRequest.new("Test Group")
pg1.load_projects("fundraising/project_list.csv")

loop do
  puts "\nHow many funding rounds? "
  answer = gets.chomp.downcase
  case answer
  when /^\d+$/
    pg1.request_funding(answer.to_i)
  when 'quit', 'exit'
    pg1.save_projects("fundraising/funding_results.csv")
    break
  else
    puts "\nPlease enter a valid number or quit to exit"
  end

end

pg1.print_results