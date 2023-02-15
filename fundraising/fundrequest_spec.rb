require_relative 'fundrequest'

describe FundRequest do

  before do
    @fundrequest = FundRequest.new("VC-Friendly Start-up Projects")

    @initial_funds = 1000
    @project = Project.new("mickey mouse manor", @initial_funds, 5000, "01/01/2001")
    @fundrequest.add_project(@project)
  end

  it "adds funds to a project if an even number is rolled" do
    Die.any_instance.stub(:roll_d6).and_return(4)

    @fundrequest.request_funding(2)

    @project.current_amount.should == @initial_funds + (25 * 2)
    puts @initial_funds
  end

  it "removes funds to a project if an odd number is rolled" do
    Die.any_instance.stub(:roll_d6).and_return(3)

    @fundrequest.request_funding(2)

    @project.current_amount.should == @initial_funds - (15 * 2)
    puts @initial_funds
  end

  it "assigns a pledge for amount during a project's funding round" do
    fundrequest = FundRequest.new("VC-Friendly Start-up Projects")
    project = Project.new("Project ABC", 1000, 2000, "01/01/2001")

    fundrequest.add_project(project)

    fundrequest.request_funding(1)

    project.pledges.should_not be_zero
  end

end

