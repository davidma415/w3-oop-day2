class Zombie
  @@horde = []
  @@plague_level = 10
  @@max_speed = 5
  @@max_strength = 8
  @@default_speed = 1
  @@default_strength = 3

  def initialize(spd, str)
    if spd > @@max_speed
      @spd = @@default_speed
    else
      @spd = spd
    end

    if str > @@max_strength
      @str = default_strength
    else
      @str = str
    end
  end

  def outrun_zombie?
    run_speed = rand(@@max_speed)
    if run_speed > @spd
      return true
    else
      return false
    end
  end

  def survive_attack?
    random_str = rand(@@max_strength)
    if random_str > @str
      return true
    else
      return false
    end
  end

  def encounter
    if outrun_zombie? == true
      return "You outran the zombie!"
    elsif outrun_zombie? == false && survive_attack? == true
      @@horde << initialize(rand(@@max_speed), rand(@@max_strength))
      return "You are now a zombie!"
    elsif outrun_zombie? == false && survive_attack? == false
      return "You have died."
    else
      return "You outran the zombie!"
    end
  end
  def self.plague_level
    @@plague_level
  end

  def self.plague_level=(int)
    @@plague_level = int
  end

  def self.all
    return @@horde
  end

  def self.spawn
    rand(@@plague_level).times do
      @@horde << self.new(rand(@@max_speed), rand(@@max_strength))
    end
  end

  def self.increase_plague_level
    @@plague_level += rand(0..3)
  end

  def self.some_die_off
    rand(0..11).times do
      @@horde.delete(@@horde.sample)
    end
  end

  def self.new_day
    self.some_die_off
    self.spawn
    self.increase_plague_level
  end
end

carl = Zombie.new(3, 3)
Zombie.spawn
puts Zombie.all
puts "It's a new day"
Zombie.new_day
puts Zombie.all
puts Zombie.plague_level


zombie1 = Zombie.all[0]

puts zombie1.encounter
