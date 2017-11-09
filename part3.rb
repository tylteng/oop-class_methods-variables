class Zombie
  @@horde = []
  @@plague_level = 10
  @@max_speed = 5
  @@max_strength = 8
  @@default_speed = 1
  @@default_strength = 3

  def initialize(speed, strength)
    @speed = speed
    if @speed > @@max_speed
      @speed = @@default_speed
      return @speed
    end
    @strength = strength
    if @strength > @@max_strength
      @strength = @@default_strength
      return @strength
    end
  end

  def self.all
    @@horde
  end

  def self.spawn
    x = rand(@@plague_level)
    # speed = rand(@@max_speed)
    # strength = rand(@@max_strength)
    x.times do
      zombie = Zombie.new((rand(@@max_speed)), (rand(@@max_strength)))
      @@horde << zombie
    end
    @@horde.length
  end

  def self.some_die_off
    x = rand(@@plague_level)
    x.times do
      @@horde.pop
    end
  end

  def self.increase_plague_level
    x = rand(2)
    @@plague_level += x
  end

  def self.new_day
    Zombie.some_die_off
    Zombie.increase_plague_level
    Zombie.spawn
  end

  def outrun_zombie?
    x = rand(@@max_speed)
    if @speed < (x)
      true
    else
      false
    end
  end

  def survive_attack?
    x = rand(@@max_strength)
    if @strength < (x)
      true
    else
      false
    end
  end

  def encounter
    outrun = self.outrun_zombie?
    outstrength = self.survive_attack?

    if outrun == true && outstrength == true
      return "you escaped unscathed"
    elsif outrun == true && outstrength == false
      @@horde << Zombie.new((rand(@@max_speed)), (rand(@@max_strength)))
      return "you escaped but you now have the plague"
    elsif outrun == false && outstrength == true
      @@horde << Zombie.new((rand(@@max_speed)), (rand(@@max_strength)))
      return "you escaped but you now have the plague"
    else outrun == false && outstrength == false
      return "you have been killed by the zombie"
    end
  end

  def self.encounter_horde
    @@horde.each do |x|
      x.encounter
    end
  end

end

# Zombie.new_day
# p Zombie.all.inspect

tyler = Zombie.new(2, 6)

p tyler.encounter

p Zombie.all.inspect
