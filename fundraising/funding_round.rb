require_relative 'die'
require_relative 'pledge_levels'
module FundingRound
  def self.fund_project(project)
    die = Die.new
    number_rolled = die.roll_d6
    # amount_rolled = die.roll_d100
    if number_rolled.odd?
      project.remove_funds
    else
      project.add_funds
    end

    pledge_selected = PledgeLevels.random
    project.received_pledge(pledge_selected)
  end
end