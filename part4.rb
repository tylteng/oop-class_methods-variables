class Vampire
@@coven = []  #vampires
@@sun = false

  def initialize(name)
    @name = name
    @age = 0
    @in_coffin = false
    @drank_blood_today = false
    @@coven << self
  end

# READERS
  def self.coven
    @@coven
  end

  def blood
    @drank_blood_today
  end

  def coffin
    @in_coffin
  end
  def vampire_name
    "Count #{@name}"
  end

  def vampire_age
    "#{@age} days old"
  end

# WRITERS
  def self.sunrise
    @@sun = true
    Vampire.coven.delete_if do |vampire|
      !vampire.blood || !vampire.coffin
    end
  end

  def self.sunset
    @@sun = false
  end

  def drink_blood
    @drank_blood_today = true
  end

  def go_home
    @in_coffin = true
  end

  def hunt
    @drank_blood_today = false
    @in_coffin = false
    @age += 1
  end
end


tyler = Vampire.new("Tyler")
edwin = Vampire.new("Edwin")

tyler.drink_blood
tyler.go_home
edwin.drink_blood
edwin.go_home
p Vampire.coven
Vampire.sunrise
tyler.hunt
edwin.hunt
p Vampire.coven
