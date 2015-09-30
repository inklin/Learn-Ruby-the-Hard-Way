class Engine
  def initialize(scene_map)
    @scene_map = scene_map
  end

  def play()
    current_scene = @scene_map.opening_scene()
    finish_scene = @scene_map.next_scene('finish')

    # while the current scene is not the last scene, 
    # enter the scene and when the scene is finished, get the next scene from the returned value
    # create a new instance of the next scene and set it to the new current scene
    while current_scene != finish_scene
      next_scene_name = current_scene.enter()
      current_scene = @scene_map.next_scene(next_scene_name)
    end

    # enter the last finish scene
    current_scene.enter()
  end
end

class Scene
  def enter()
    puts "You have entered a scene."
    puts "This enter method should be overwitten by sub-classes."
    exit(1)
  end
end

class Market < Scene
  def enter()
    puts "This game is (very vaguely) inspired by Neil Gaiman's Stardust. An excellent book."
    puts "You are an ordinary person living in the small village of Wall."
    puts "Wall is bordered by a magical land, Faerie. Every few years, a travelling market comes to Wall."
    puts "You encounter a merchant with beautiful glass flowers."
    puts "A particularly delicate glass snowdrop catches your eyes. You take out some coins to buy it."
    puts "The merchant, a young with with ears like a cat, asks that you give her a kiss on the cheek."

    print "> "
    purchase = $stdin.gets.chomp

    if purchase.include?("kiss") || purchase.include?("meow")
      puts "You give the merchant girl a light kiss on the cheek and she gives you the snowdrop."
      puts "You look carefully at the snowdrop and inside it, see a deep forest."
      puts "When you look back up, you realize you're suddenly standing inside a forest with no sign of anyone around."
      return 'forest'
    elsif purchase.include?("buy") || purchase.include?("coins")
      puts "You insist on giving the merchant coins."
      puts "She gets offended that you would try to buy a magical item with mortal coins."
      puts "She shooes you away and you explore the other parts of the market but nothing stands out."
      puts "You figure there will always be next time and go home." 
      puts "Unfortunately, you just lost your one chance at adventure."
      return 'lose'
    else
      return 'market'
    end
  end
end

class Forest < Scene
  def enter()
    puts "You're in Faerie."
    puts "You hear a crack of branches and spin around to see a unicorn!"
    puts "The unicorn looks at you with caution. Its horn looks awfully menacing."
    puts "Do you try to give it the snowdrop as an offering, or climb up to the safety of a tree?"

    print "> "
    unicorn = $stdin.gets.chomp
    if unicorn.include?('snowdrop')
      puts "You offer the snowdrop to the unicorn."
      puts "The unicorn accepts the payment and offers you a ride on its back."
      puts "You two hurry along in the forest, finally arriving in front of a cozy little inn."
      return 'inn'
    elsif unicorn.include?('tree') || unicorn.include?('climb')
      puts "You try to climb onto a tree but as you're climbing on the branches,"
      puts "the unicorn angrily rams the tree with its horn."
      puts "The tree shakes violently and you fall out of the tree to your demise."
      return 'lose'
    else
      return 'forest'
    end
  end
end

class Inn < Scene
  def enter()
    puts "You are welcomed into the inn by a lovely little old lady."
    puts "As you settle into your bedroom for the night, you hear the sharpening of knives downstairs."
    puts "You sneak to the stairway, only to discover that the little old lady is a witch!"
    puts "She is planning to take your heart to recover her lost youth! Look for a weapon quickly."
    puts "Where will you look? 1. The closet 2. The book shelf 3. Under the Bed 4. In a drawer 5. On the Balcony"

    print "> "
    guess = $stdin.gets.chomp.to_i

    while !(guess >= 1 && guess <= 5)
      print "Choose a valid number! > "
      guess = $stdin.gets.chomp_to_i
    end

    places = ["in the closet", "on the bookshelf", "under the bed", "in a drawer", "on the balcony"]
    puts "You choose to look %s." % places[guess-1]

    if !(guess == 2 || guess == 5 || guess == 3)
      puts "Unfortunately there's nothing there that can help you!"
      puts "The witch bursts through the door and takes you for her victim."
      return 'lose'
    elsif guess == 2
      puts "You see an old looking candle that only has a bit of wax left."
      puts "Remembering a vague memory of the Stardust story, you light the candle with the flame in the fireplace."
      puts "You feel a rush of wind just as the witch bursts through the door. You have lighted a Babylon candle that will take you anywhere."
      puts "You yell 'home!' and the scene spins crazily around you, until you find yourself safely back at Wall."
      return 'finish'
    elsif guess == 5
      puts "You see the unicorn below the balcony, it came back for you!"
      puts "'Help me!' you scream, before the witch bursts through the door."
      puts "Without thinking, you jump off the balcony and magically land on the unicorn's back."
      puts "The unicorn gallops away safely and eventually brings you safely home to Wall."
      return 'finish'
    elsif guess == 3
      return 'battle'
    end

  end
end

class Hero
  attr_accessor :health

  def initialize()
    @health = 10
  end

  def rest()
    @health += 2
  end

  def attack(opponent)
    @opponent = opponent
    @opponent.health -= 3
  end
end

class Witch
  attr_accessor :health

  def initialize()
    @health = 10
  end

  def attack(opponent, accuracy_number)
    @opponent = opponent
    if accuracy_number > 5
      puts "The witch attacks you with lightning and hits you!"
      @opponent.health -= 3 
    else
      puts "The witch attacks you with lightning but misses!"
    end
  end
end


class Battle < Scene

  def enter()
    puts "You pull out a long sword from under the bed just as you come face to face with the witch."
    @hero = Hero.new()
    @witch = Witch.new()

    puts "Time to fight the witch. You are at full health with #{@hero.health} health points."

    while (@witch.health > 0)
      accuracy = rand(1..10)

      @witch.attack(@hero, accuracy)
      if (@hero.health <= 0)
        puts "You have zero health."
        return 'lose'
      end
      puts "You have #{@hero.health} health points."
      print "Are you going to rest to recuperate your health or attack? > "
      decision = $stdin.gets.chomp

      if decision == "attack"
        @hero.attack(@witch)
        puts "You attacked and your opponent now has #{@opponent.health} points."
      elsif decision == "rest"
        @hero.rest
      end
    end

    puts "The witch gives a final shriek and dissolves into a puddle of water."
    return 'finish'
  end

end

class Lose < Scene
  def enter()
    puts "Sadly, this is the end of the game for you."
    exit(1)
  end
end

class Finish < Scene
  def enter()
    puts "You are a winner!"
    exit(1)
  end
end

class Map
  @@scenes = {
    'market' => Market.new(),
    'forest' => Forest.new(),
    'inn' => Inn.new(),
    'battle' => Battle.new(),
    'finish' => Finish.new(),
    'lose' => Lose.new()
  }

  def initialize(start_scene)
    @start_scene = start_scene
  end

  def next_scene(next_scene_name)
    next_scene_value = @@scenes[next_scene_name]
    return next_scene_value
  end

  def opening_scene()
    next_scene(@start_scene)
  end
end

## set game_map to a new instance of Map
game_map = Map.new('market')
## set game_engine to a new instance of Engine and initialize the Engine with a game_map parameter
game_engine = Engine.new(game_map)
## from the game_engine object, get the play function and call it
game_engine.play()