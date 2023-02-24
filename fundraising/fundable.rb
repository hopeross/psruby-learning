module Fundable
  def remove_funds
    @current_amount -= 15
    puts "\n#{@name} lost some funds!"
  end

  def add_funds
    @current_amount += 25
    puts "\n#{@name} got more funds!"
  end

  def full?
    total_funding_outstanding <= 0
  end

  def total_funding_outstanding
    @target_amount - total_funds
  end
end