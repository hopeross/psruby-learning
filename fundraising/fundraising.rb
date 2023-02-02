class Create_Project
  attr_reader :project_current_funding, :project_target_funding, :project_name
  attr_writer :project_name

  def initialize(name, current_funding=0, target_funding, date_started)
    @project_name = name.upcase
    @project_current_funding = current_funding
    @project_target_funding = target_funding
    @project_start_date = date_started
  end

  def to_s
    "Project #{@project_name} was created on #{@project_start_date}. Currently they have raised $#{@project_current_funding}."
  end

  def remaining
    funds_to_go = @project_target_funding - @project_current_funding
    "\tThey need $#{funds_to_go} to hit their goal of $#{@project_target_funding}\n\n"
  end

  def add_funding(amount)
    @project_current_funding += amount
    "The project received $#{amount} in funding."
  end

  def remove_funding(amount)
    @project_current_funding -= amount
    "The project lost $#{amount} in funding."
  end
end

class Current_Projects
  def initialize (name)
    @project_group = name
    @projects = []
  end

  def add_project(project)
    @projects << project
  end

  def list_projects()

    puts("There are #{@projects.length} projects currently available to fund in #{@project_group}: \n\n")

    @projects.each do |project|
      puts project.add_funding(300)
      puts project.remove_funding(50)
      puts project.add_funding(750)
      puts project
      puts project.remaining
    end

  end

end

def get_date(offset=0)
  current_date = Time.now - (offset * 24 * 3600)
  current_date.strftime("%m/%d/%Y")
end

project1 = Create_Project.new("APPLE ACRES", 500, 50000, get_date)
project2 = Create_Project.new("Blue's Books", 100, get_date(7))
project3 = Create_Project.new("cat condos", 1200, 10000, get_date(40))

pg1 = Current_Projects.new("RealEstate")
pg1.add_project(project1)
pg1.add_project(project3)
pg1.list_projects

pg2 = Current_Projects.new("Shopping")
pg2.add_project(project2)
pg2.list_projects

