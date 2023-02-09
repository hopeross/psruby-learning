require_relative 'die'
require_relative 'funding_round'

class Project
  attr_reader :project_group
  def initialize (name)
    @project_group = name
    @projects = []
  end

  def add_project(project)
    @projects << project
  end

  def print_name_and_current_funding(project)
    puts ("#{project.project_name} (#{project.project_current_funding})")
  end
  def funding_check
    fully, under = @projects.partition { |p| p.full? }
    puts "\nThere are #{fully.size} fully funded projects"
    fully.each do |project|
      print_name_and_current_funding(project)
    end

    puts "\nThere are #{under.size} under funded projects"
    under.each do |project|
      print_name_and_current_funding(project)
    end

    puts "\nThe following projects still need funding: "
    sorted_projects = @projects.sort { |a, b| b.funds_to_go <=> a.funds_to_go }
    sorted_projects.each do |project|
      formatted_information = project.project_name.ljust(30, '.')
      if project.funds_to_go > 0
        puts "#{formatted_information} #{project.funds_to_go}"
      end
    end
  end

  def list_projects(rounds)
    puts("There are #{@projects.length} projects currently available to fund in #{@project_group}: \n\n")

    1.upto(rounds) do | round |
      puts("\nFunding Round: #{round}\n\n")

      @projects.each do |project|
        FundingRound.fund_project(project)
        puts project
        puts project.remaining
      end
    end

    funding_check
  end
end