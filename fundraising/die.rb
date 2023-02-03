class Die
  attr_reader :number, :amount_roll

  def roll
    @number = rand(1..6)
  end

  def amount_roll
    @amount_rolled = rand(10..100)
  end
end