class Die
  attr_reader :number, :d10_number

  def roll
    @number = rand(1..6)
  end
  def roll_d10
    @d10_number = rand(1..10)
  end
end