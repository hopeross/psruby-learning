require_relative 'auditable'
module StudioGame
  class LoadedDie
    include Auditable

    attr_reader :d6_number

    def roll_d6
      numbers = [1, 1, 2, 5, 6, 6]
      @d6_number = numbers.sample
      audit(@d6_number)
      @d6_number
    end
  end

end