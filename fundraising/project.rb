class Project
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