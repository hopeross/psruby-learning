require_relative 'project'

class MatchProject < Project
  def initialize(name, current_funding_amount, target_funding_amount = nil, start_date)
    super(name, current_funding_amount, target_funding_amount, start_date)
    @halfway_funded = target_funding_amount / 2
  end

  def halfway_funded?
    @halfway_funded <= current_amount
  end

  def add_funds
    if halfway_funded?
      puts("The project hit the half-way point")
      @current_amount += 50
    else
      super
    end
  end
end

if __FILE__ == $0
  matchingproject = MatchProject.new("Matching 123", 0, 100, "01/01/2001")
  3.times { matchingproject.add_funds }
  puts matchingproject.current_amount
end
