require_relative 'spec_helper'
require_relative 'project'
require_relative 'fundrequest'
require_relative 'die'

describe Project do
  before do
    @current_funding = 100
    @target_funding = 10000
    @start_date = "01/01/2001"
    @fund_request = FundRequest.new("Testing McTesterson", @current_funding, @target_funding, @start_date)
    @project = Project.new("Testbed")
    @project.add_project(@fund_request)
  end

  it "adds a funding request to the project list" do
    @project.project_group.should == "Testbed"
  end

  it "adds funds on high roll" do
    Die.any_instance.stub(:roll).and_return(5)
    Die.any_instance.stub(:amount_roll).and_return(50)

    @project.list_projects
    @fund_request.project_current_funding.should == 150
  end

  it "skips project on middle roll" do
    Die.any_instance.stub(:roll).and_return(3)
    Die.any_instance.stub(:amount_roll).and_return(50)

    @project.list_projects
    @fund_request.project_current_funding.should == 100
  end

  it "removes funds on low roll" do
    Die.any_instance.stub(:roll).and_return(1)
    Die.any_instance.stub(:amount_roll).and_return(50)

    @project.list_projects
    @fund_request.project_current_funding.should == 50
  end
end

# Die.any_instance.stub(:roll).and_return(5)
# @game.play
# @player.player_health.should == @initial_health + 15