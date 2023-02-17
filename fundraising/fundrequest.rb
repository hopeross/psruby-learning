require_relative 'project'
require_relative 'funding_round'
require_relative 'pledge_levels'
require_relative 'die'
class FundRequest
  attr_reader :project_group

  def initialize(group)
    @project_group = group
    @projects = []
  end

  def add_project(project)
    @projects.push(project)
  end

  def load_projects(from_file)
    File.readlines(from_file).each do |line|
      puts line
      name, cf, tf = line.split(',')
      project = Project.new(name.chomp, Integer(cf), Integer(tf), get_date(42))
      add_project(project)
    end
  end

  def save_projects(to_file)
    File.open(to_file, "w") do |file|
      file.puts "Results of funding round(s)"

      sorted_projects = @projects.sort { |a, b| b.total_funding_outstanding <=> a.total_funding_outstanding}

      sorted_projects.each do |project|
        formatted_name = project.name.ljust(20, '.')
        file.puts "#{formatted_name} $#{project.total_funds} (goal was: #{project.target_amount})"
      end
    end
  end

  def get_date(offset=0)
    current_date = Time.now - (offset * 24 * 3600)
    current_date.strftime("%m/%d/%Y")
  end

  def request_funding(rounds)
    puts "There are #{@projects.size} projects that you could fund: "

    @projects.each do |project|
      puts project
    end

    pledges = PledgeLevels::PLEDGES
    puts "There are #{pledges.size} possible pledge amounts: "
    pledges.each do |p|
      puts "A #{p.name} is worth $#{p.amount}"
    end

    1.upto(rounds) do |round|
      @projects.each do |project|
        FundingRound.fund_project(project)
        puts project
      end
    end
  end

  def print_name(project)
    puts "#{project.name}"
  end

  def print_results
    fully, under = @projects.partition { |project | project.full? }

    puts "\n#{fully} Fully Funded Projects: "
    fully.each do |project|
      print_name(project)
    end

    puts "\n#{under} Under Funded Projects: "
    under.each do |project|
      print_name(project)
    end

    sorted_projects = under.sort { |a, b| b.total_funding_outstanding <=> a.total_funding_outstanding}
    puts "\n#{under.size} projects still need your help: "
    sorted_projects.each do |project|
      formatted_name = project.name.ljust(20, '.')
      puts "#{formatted_name} $#{project.total_funding_outstanding} under"
    end

    @projects.each do | project |
      puts "\n#{project.name}'s pledges: "
      project.each_pledge do |pledge|
        puts "$#{pledge.amount} in #{pledge.name} pledges"
      end
      puts "$#{project.pledges} in total pledges"
    end
  end
end