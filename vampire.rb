class Vampire
  @@coven = []

  def initialize(name, age, in_coffin, blood)
    @name = name
    @age = age
    @in_coffin = in_coffin
    @drank_blood_today = blood
  end

  def drink_blood
    @drank_blood_today = true
  end

  def drank_blood_today
    return @drank_blood_today
  end

  def drank_blood_today=(boolean)
    @drank_blood_today = boolean
    return @drank_blood_today
  end

  def in_coffin
    return @in_coffin
  end

  def in_coffin=(boolean)
    @in_coffin = boolean
    return @in_coffin
  end

  def go_home
    @in_coffin = true
  end

  def self.sunrise
    @@coven.each do |vamp|
      if vamp.drank_blood_today == false || vamp.in_coffin == false
        @@coven.delete(vamp)
      end
    end
  end

  def self.create(name, age, in_coffin, blood)
    new_vamp = self.new(name, age, in_coffin, blood)
    @@coven.push(new_vamp)
    return new_vamp
  end

  def self.all
    return @@coven
  end

  def self.sunset
    @@coven.each do |vamp|
      vamp.drank_blood_today = false
      vamp.in_coffin = false
    end
  end

end

vamp1 = Vampire.create('bob', 3, false, false)
vamp1.drink_blood
p vamp1
p Vampire.all
Vampire.sunset
puts "Sunset happens"
p Vampire.all
vamp1.go_home
puts "He went home"
p vamp1
