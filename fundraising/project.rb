require_relative 'pledge_levels'

class Project
  attr_accessor :name
  attr_reader :current_amount, :target_amount
  def initialize (name, current_funding_amount, target_funding_amount=0, start_date)
    @name = name.upcase
    @target_amount = target_funding_amount
    @current_amount = current_funding_amount
    @start_date = start_date
    @project_pledges = Hash.new(0)
  end

  def to_s
    "#{name} has $#{total_funds} in funding towards a goal of $#{@target_amount}"
  end

  def remove_funds
    @current_amount -= 15
    puts "\n#{@name} lost some funds!"
  end

  def add_funds
    @current_amount += 25
    puts "\n#{@name} got more funds!"
  end

  def total_funding_outstanding
    @target_amount - total_funds
  end

  def full?
    total_funding_outstanding <= 0
  end

  def received_pledge(pledge)
    @project_pledges[pledge.name] += pledge.amount
    puts "#{@name} received a #{pledge.name} pledge with $#{pledge.amount}"
    puts "#{@name}'s pledges total: #{@project_pledges}'"
  end

  def pledges
    @project_pledges.values.reduce(0, :+)
  end

  def total_funds
    @current_amount + pledges
  end

  def each_pledge
    @project_pledges.each do |name, amount|
      yield Pledge.new(name, amount)
    end
  end

  if __FILE__ == $0
    project = Project.new("Project ABC", 5000, 250,1000)
    puts project.name
    puts project.funding
    project.remove_funds
    puts project.funding
    project.add_funds
    puts project.funding
  end
end