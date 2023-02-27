require_relative 'treasure_trove'
require_relative 'playable'

module StudioGame
  class Player
    include Playable

    attr_reader :player_name
    attr_accessor :player_health

    def initialize(name, health=100)
      @player_name = name.capitalize
      @player_health = health
      @player_treasure = Hash.new(0)
    end

    def score
      @player_health + points
    end

    def points
      @player_treasure.values.reduce(0, :+)
    end

    def player_name=(new_name)
      @player_name = new_name.capitalize
    end

    def found_treasure(treasure)
      @player_treasure[treasure.name] += treasure.points
      puts "#{@player_name} found a #{treasure.name} worth #{treasure.points}"
      puts "#{@player_name}'s treasures: #{@player_treasure}'"
    end
    def to_s
      "I'm #{@player_name} with a health = #{@player_health}, points = #{points}, score = #{score}"
    end

    def each_found_treasure
      @player_treasure.each do |name, points|
        yield Treasure.new(name, points)
      end
    end

    def <=> (other)
      other.score <=> score
    end
  end
end