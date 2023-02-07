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

  def list_projects
    puts("There are #{@projects.length} projects currently available to fund in #{@project_group}: \n\n")

    @projects.each do |project|
      FundingRound.fund_project(project)
      # puts ProgressTracker.calc_progress(project)
      puts project
      puts project.remaining
    end
  end
end