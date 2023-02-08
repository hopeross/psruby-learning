require_relative 'project'
require_relative 'fundrequest'
require_relative 'die'

def get_date(offset=0)
  current_date = Time.now - (offset * 24 * 3600)
  current_date.strftime("%m/%d/%Y")
end

die = Die.new
num_rounds = die.roll_d10

project1 = FundRequest.new("APPLE ACRES", 500, 50000, get_date)
project2 = FundRequest.new("Blue's Books", 100, get_date(7))
project3 = FundRequest.new("cat condos", 1200, 10000, get_date(14))
project4 = FundRequest.new("doggy daycare", 7500, 8000, get_date(21))
project5 = FundRequest.new("escapehaus", 300, 500, get_date(28))
project6 = FundRequest.new("fish farm", 30000, 65000, get_date(50))
project7 = FundRequest.new("grace getaways", 0, 15000, get_date(57))
project8 = FundRequest.new("houses r us", 900, 1000, get_date(75))
project9 = FundRequest.new("indigo island", 2500, 10000, get_date(82))
project10 = FundRequest.new("jacks jukeboxes", 7500, 10000, get_date(89))

pg1 = Project.new("Test Group")
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
pg1.list_projects(num_rounds)

# pg2 = Project.new("Shopping")
# pg2.add_project(project2)
# pg2.list_projects(num_rounds)

