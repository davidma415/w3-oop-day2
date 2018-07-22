class Zombie
  @@horde = []
  @@plague_level = 10
  @@max_speed = 5
  @@max_strength = 8
  @@default_speed = 1
  @@default_strength = 3

  def self.plague_level
    @@plague_level
  end

  def self.plague_level=(int)
    @@plague_level = int
  end

  def initialize(spd, str)
    if spd > @@max_speed
      spd = @@default_speed
    else
      spd = spd
    end

    if str > @@max_strength
      str = default_strength
    else
      str = str
    end
  end

end

carl = Zombie.new(3, 3)
p carl
