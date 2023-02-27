require_relative 'spec_helper'
require 'studio_game/game'

module StudioGame
  describe Game do
    before do
      @game = Game.new("Testerson")

      @initial_health = 100
      @player = Player.new("daffy", @initial_health)

      @game.add_player(@player)
    end

    it "should w00t the player on a high roll" do
      Die.any_instance.stub(:roll_d6).and_return(5)
      @game.play(2)
      @player.player_health.should == @initial_health + 15 * 2
    end

    it "should skip the player on a medium roll" do
      Die.any_instance.stub(:roll_d6).and_return(3)
      @game.play(2)
      @player.player_health.should == @initial_health
    end

    it "should blam the player on a low roll" do
      Die.any_instance.stub(:roll_d6).and_return(1)
      @game.play(2)
      @player.player_health.should == @initial_health - 10 * 2
    end

    it "assigns a treasure for points during a player's turn" do
      game = Game.new("Knuckleheads")
      player = Player.new("moe")

      game.add_player(player)

      game.play(1)

      player.points.should_not be_zero

      # or use alternate expectation syntax:
      # expect(player.points).not_to be_zero
    end

    it "computes total points as the sum of all player points" do
      game = Game.new("Knuckleheads")

      player1 = Player.new("moe")
      player2 = Player.new("larry")

      game.add_player(player1)
      game.add_player(player2)

      player1.found_treasure(Treasure.new(:hammer, 50))
      player1.found_treasure(Treasure.new(:hammer, 50))
      player2.found_treasure(Treasure.new(:crowbar, 400))

      game.total_points.should == 500
    end

    context "in a collection of players" do
      before do
        @player1 = Player.new("moe", 100)
        @player2 = Player.new("larry", 200)
        @player3 = Player.new("curly", 300)

        @players = [@player1, @player2, @player3]
      end

      it "is sorted by decreasing score" do
        @players.sort.should == [@player3, @player2, @player1]
      end
    end
  end
end