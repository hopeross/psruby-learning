require_relative 'die'
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
      die = Die.new
      number_rolled = die.roll
      amount_rolled = die.amount_roll

      case number_rolled
      when 1..2
        puts project.remove_funding(amount_rolled)
      when 3..4
        puts("Project was skipped")
      when 5..6
        puts project.add_funding(amount_rolled)
      end

      puts project
      puts project.remaining
    end
  end
end