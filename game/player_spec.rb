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
    @player.to_s.should == "I'm Kitty with a health = 150, points = 0, score = 150"
  end

  it "computers a score as the sum of its health and length of name" do
    @player.score.should == 150
  end

  it "increases health by 15 when healed (aka w00ted)" do
    @player.w00t

    @player.player_health.should == @initial_health + 15
  end

  it "decreases health by 10 when damaaged (aka blammed)" do
    @player.blam
    @player.player_health.should == @initial_health - 10
  end

  it "computes a score as the sum of its health and points" do
    @player.found_treasure(Treasure.new(:hammer, 50))
    @player.found_treasure(Treasure.new(:hammer, 50))

    @player.score.should == 250
  end

  it "computes points as the sum of all treasure points" do
    @player.points.should == 0

    @player.found_treasure(Treasure.new(:hammer, 50))

    @player.points.should == 50

    @player.found_treasure(Treasure.new(:crowbar, 400))

    @player.points.should == 450

    @player.found_treasure(Treasure.new(:hammer, 50))

    @player.points.should == 500
  end

  it "computes a score as the sum of its health and points" do
    @player.found_treasure(Treasure.new(:hammer, 50))
    @player.found_treasure(Treasure.new(:hammer, 50))

    @player.score.should == 250
  end

  it "yields each found treasure and its total points" do
    @player.found_treasure(Treasure.new(:skillet, 100))
    @player.found_treasure(Treasure.new(:skillet, 100))
    @player.found_treasure(Treasure.new(:hammer, 50))
    @player.found_treasure(Treasure.new(:bottle, 5))
    @player.found_treasure(Treasure.new(:bottle, 5))
    @player.found_treasure(Treasure.new(:bottle, 5))
    @player.found_treasure(Treasure.new(:bottle, 5))
    @player.found_treasure(Treasure.new(:bottle, 5))

    yielded = []
    @player.each_found_treasure do |treasure|
      yielded << treasure
    end

    yielded.should == [
      Treasure.new(:skillet, 200),
      Treasure.new(:hammer, 50),
      Treasure.new(:bottle, 25)
    ]
  end

  context do
    before do
      @player = Player.new("Snoopy")
    end

    it "has a default health value of 100" do
      @player.player_health.should == 100
    end
  end

  context do
    before do
      @player = Player.new("Popeye", 150)
    end

    it "is a strong character" do
      @player.strong?.should be true
    end
  end

  context do
    before do
      @player = Player.new("Kermit", 70 )
    end

    it "is a whimpy character" do
      @player.strong?.should be false
    end
  end

end