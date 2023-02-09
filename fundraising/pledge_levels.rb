Pledge = Struct.new(:name, :amount)

module PledgeLevels
  PLEDGES = [
    Pledge.new(:copper, 10),
    Pledge.new(:bronze, 25),
    Pledge.new(:silver, 50),
    Pledge.new(:gold, 100),
    Pledge.new(:platinum, 250),
    Pledge.new(:diamond, 500)
  ]

  def self.random
    PLEDGES.sample
  end
end