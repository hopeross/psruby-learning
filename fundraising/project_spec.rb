require_relative 'spec_helper'
require_relative 'fundrequest'

describe FundRequest do
  before do
    @current_funding = 100
    @target_funding = 10000
    @start_date = "01/01/2001"
    @project = FundRequest.new("Testing McTesterson", @current_funding, @target_funding, @start_date)
  end

  it "has a project name in all caps" do
    @project.project_name.should == "TESTING MCTESTERSON"
  end

  it "has a current funding amount of 100" do
    @project.project_current_funding.should == 100
  end

  it "has a target funding amount of 10000" do
    @project.project_target_funding.should == 10000
  end

  it "has a date the project started raising funds" do
    @project.project_start_date.should == "01/01/2001"
  end

  it "will increase current funding when funds are added" do
    @project.add_funding(100)
    @project.project_current_funding.should == 200
  end

  it "will decrease current funding when funds are removed" do
    @project.remove_funding(50)
    @project.project_current_funding.should == 50
  end

  it "will calculate the funds remaining to hit goal" do
    @project.remaining.should == "\tThey need $9900 to hit their goal of $10000\n\n"
  end


end


