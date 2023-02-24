module Playable
  def strong?
    (player_health >= 100)
  end

  def blam
    self.player_health -= 10
    puts "#{player_name} got blammed!"
  end

  def w00t
    self.player_health += 15
    puts "#{player_name} got w00ted!"
  end
end