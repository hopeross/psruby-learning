require_relative 'die'
module FundingRound
  def self.fund_project(project)
    die = Die.new
    number_rolled = die.roll_d6
    amount_rolled = die.roll_d100

    case number_rolled
      when 1..2
        puts project.remove_funding(amount_rolled)
      when 3..4
        puts("Project was skipped")
      when 5..6
        puts project.add_funding(amount_rolled)
    end
  end
end