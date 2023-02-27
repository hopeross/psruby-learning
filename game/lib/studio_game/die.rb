require_relative 'auditable'

module StudioGame
  class Die
    include Auditable

    attr_reader :d6_number, :d10_number

    def roll_d6
      @d6_number = rand(1..6)
      audit(@d6_number)
      @d6_number
    end
    def roll_d10
      @d10_number = rand(1..10)
      audit(@d100_number)
      @d100_number
    end
  end
end