class Die
  attr_reader :d6_number, :d10_number

  def roll_d6
    @d6_number = rand(1..6)
  end
  def roll_d10
    @d10_number = rand(1..10)
  end
end