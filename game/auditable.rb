module Auditable
  def audit(number)
    puts "Rolled a #{number} (#{self.class})"
  end
end