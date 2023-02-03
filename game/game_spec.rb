require_relative 'spec_helper'
require_relative 'game'

describe Game do
  before do
    @game = Game.new("Testerson")

    @initial_health = 100
    @player = Player.new("daffy", @initial_health)

    @game.add_player(@player)
  end

  it "should w00t the player on a high roll" do
    Die.any_instance.stub(:roll).and_return(5)
    @game.play
    @player.player_health.should == @initial_health + 15
  end

  it "should skip the player on a medium roll" do
    Die.any_instance.stub(:roll).and_return(3)
    @game.play
    @player.player_health.should == @initial_health
  end

  it "should blam the player on a low roll" do
    Die.any_instance.stub(:roll).and_return(1)
    @game.play
    @player.player_health.should == @initial_health - 10
  end
end