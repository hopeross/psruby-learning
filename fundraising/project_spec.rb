require_relative 'project'

describe Project do

  before do
    @initial_funds = 1000
    @project = Project.new("mickey mouse manor", @initial_funds, 5000, "01/01/2001")
  end

  it "has an initial target funding amount" do
    @project.target_amount.should == 5000
  end

  it "computes the total funds outstanding as the target funding amount minus the funding amount" do
    @project.total_funding_outstanding.should == (5000 - 1000)
  end

  it "increases funds by 25 when funds are added" do
    @project.add_funds

    @project.current_amount.should == @initial_funds + 25
  end

  it "decreases funds by 15 when funds are removed" do
    @project.remove_funds

    @project.current_amount.should == @initial_funds - 15
  end

  context "created without a funding amount" do
    before do
      @project = Project.new("mickey mouse manor", 5000,"01/01/2001")
    end

    it "has a default funding amount of 0" do
      @project.target_amount.should == 0
    end
  end

  context "when total funding outstanding is less than or equal to 0" do
    before do
      @project = Project.new("mickey mouse manor", 5500, 5000,"01/01/2001")
    end

    it "is fully-funded" do
      @project.should be_full
    end
  end

  context "when total funding outstanding is greater than 0" do
    before do
      @project = Project.new("ProjectABC", 0, 1000, "01/01/2001")
    end

    it "is under-funded" do
      @project.should_not be_full
    end
  end

  it "computes pledges as the sum of all pledges" do
    @project.pledges.should == 0

    @project.received_pledge(Pledge.new(:copper, 10))

    @project.pledges.should == 10

    @project.received_pledge(Pledge.new(:bronze, 25))

    @project.pledges.should == 35

    @project.received_pledge(Pledge.new(:silver, 50))

    @project.pledges.should == 85

    @project.received_pledge(Pledge.new(:gold, 100))

    @project.pledges.should == 185

    @project.received_pledge(Pledge.new(:platinum, 250))

    @project.pledges.should == 435

    @project.received_pledge(Pledge.new(:diamond, 500))

    @project.pledges.should == 935
  end

  it "computes total funds as the sum of a projects funding and pledges" do
    @project.received_pledge(Pledge.new(:gold, 100))
    @project.received_pledge(Pledge.new(:gold, 100))

    @project.total_funds.should == 1200
  end

  it "yields each received pledge and its total pledge amount" do
    @project.received_pledge(Pledge.new(:bronze, 50))
    @project.received_pledge(Pledge.new(:silver, 75))
    @project.received_pledge(Pledge.new(:silver, 75))
    @project.received_pledge(Pledge.new(:gold, 100))
    @project.received_pledge(Pledge.new(:gold, 100))
    @project.received_pledge(Pledge.new(:gold, 100))

    yielded = []
    @project.each_pledge do |pledge|
      yielded << pledge
    end

    yielded.should == [
      Pledge.new(:bronze, 50),
      Pledge.new(:silver, 150),
      Pledge.new(:gold, 300)
    ]
  end

end