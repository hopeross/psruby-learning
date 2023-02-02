require_relative 'project'
require_relative 'fundrequest'

def get_date(offset=0)
  current_date = Time.now - (offset * 24 * 3600)
  current_date.strftime("%m/%d/%Y")
end

project1 = FundRequest.new("APPLE ACRES", 500, 50000, get_date)
project2 = FundRequest.new("Blue's Books", 100, get_date(7))
project3 = FundRequest.new("cat condos", 1200, 10000, get_date(40))

pg1 = Project.new("RealEstate")
pg1.add_project(project1)
pg1.add_project(project3)
pg1.list_projects

pg2 = Project.new("Shopping")
pg2.add_project(project2)
pg2.list_projects

