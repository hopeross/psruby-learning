require_relative 'spec_helper'
require_relative 'player'

describe Player do
  before do
    @initial_health = 150
    @player = Player.new("kitty", @initial_health)
    @score = @initial_health + @player.player_name.length
  end

  it "has a capitalized name" do
    @player.player_name.should == "Kitty"
  end

  it "has an initial health" do
    @player.player_health.should == @initial_health
  end

  it "has a string representation" do
    @player.to_s.should == "I'm Kitty with a health of 150 and a score of 155"
  end

  it "computers a score as the sum of its health and length of name" do
    @player.score.should == 155
  end

  it "increases health by 15 when healed (aka w00ted)" do
    @player.w00t

    @player.player_health.should == @initial_health + 15
  end

  it "decreases health by 10 when damaaged (aka blammed)" do
    @player.blam
    @player.player_health.should == @initial_health - 10
  end

  context do
    before do
      @player = Player.new("Snoopy")
    end

    it "has a default health value of 100" do
      @player.player_health.should == 100
    end
  end

end