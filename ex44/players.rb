class Zombie
  attr_accessor :health
  attr_reader :type

  def initialize()
    @health = 15
    @type = "zombie"
  end

  def attack(target)
    @target = target
    accuracy = rand(1..10)

    if @health > 10
      @target.health -= 5
      puts "The zombie attacks you, ouch!"
    else
      if accuracy > 5
        @target.health -= 5
        puts "The zombie attacks you, ouch!"
      else
        puts "The zombie reaches for you, but misses! Phew."
      end
    end
  end

end

class Player
  attr_accessor :health

  def initialize()
    @health = 15
  end

  def attack(target)
    attack_points = 2
    @target = target
    @target.health -= attack_points
  end

  def rest()
    @health += 7
  end
end