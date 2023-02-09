require_relative 'die'
require_relative 'pledge_levels'
module FundingRound
  def self.fund_project(project)
    die = Die.new
    number_rolled = die.roll_d6
    # amount_rolled = die.roll_d100
    pledge_selected = PledgeLevels.random
    amount_rolled = pledge_selected.amount
    pledge_level = pledge_selected.name

    case number_rolled
      when 1..2
        puts project.remove_funding(amount_rolled, pledge_level)
      when 3..4
        puts("Project was skipped")
      when 5..6
        puts project.add_funding(amount_rolled, pledge_level)
    end
  end
end