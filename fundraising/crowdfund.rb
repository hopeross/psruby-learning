require_relative 'project'
require_relative 'fundrequest'
require_relative 'die'

def get_date(offset=0)
  current_date = Time.now - (offset * 24 * 3600)
  current_date.strftime("%m/%d/%Y")
end

die = Die.new
num_rounds = die.roll_d10
# num_rounds = 1

project1 = Project.new("APPLE ACRES", 500, 50000, get_date)
project2 = Project.new("Blue's Books", 100, get_date(7))
project3 = Project.new("cat condos", 1200, 10000, get_date(14))
project4 = Project.new("doggy daycare", 7500, 8000, get_date(21))
project5 = Project.new("escapehaus", 300, 500, get_date(28))
project6 = Project.new("fish farm", 30000, 65000, get_date(50))
project7 = Project.new("grace getaways", 0, 15000, get_date(57))
project8 = Project.new("houses r us", 900, 1000, get_date(75))
project9 = Project.new("indigo island", 2500, 10000, get_date(82))
project10 = Project.new("jacks jukeboxes", 7500, 10000, get_date(89))

pg1 = FundRequest.new("Test Group")
pg1.add_project(project1)
pg1.add_project(project2)
pg1.add_project(project3)
pg1.add_project(project4)
pg1.add_project(project5)
pg1.add_project(project6)
pg1.add_project(project7)
pg1.add_project(project8)
pg1.add_project(project9)
pg1.add_project(project10)
pg1.request_funding(num_rounds)
pg1.print_results

# pg2 = Project.new("Group Two")
# pg2.add_project(project2)
# pg2.list_projects(num_rounds)

