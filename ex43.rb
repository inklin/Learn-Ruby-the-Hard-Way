## Game scene
class Scene 
  def enter()
    abort("This function 'enter' should not be used directly. Please subclass Scene and implement an enter method.")
  end
end

## Game engine
class Engine
  ## the initialize function takes a scene_map parameter
  def initialize(scene_map)
    @scene_map = scene_map
  end

  def play()
    ## from the scene map, get the opening scene 
    ## as the current_scene, note that this returns an instance of a Class
    current_scene = @scene_map.opening_scene()
    ## the end scene is when you reach 'win'
    end_scene = @scene_map.next_scene('win')

    ## while the current scene is not the last scene,
    ## keep playing.
    while current_scene != end_scene
      ## call the enter function on the current_scene
      ## and store the returned value as the next_scene_name
      next_scene_name = current_scene.enter()
      ## move to the next scene, the current scene is now
      ## an instance of the "next" scene
      current_scene = @scene_map.next_scene(next_scene_name)
    end

  end
end


## All classes below are subclasses of Scene

## This is when the player wins the game
class Win < Scene
  def enter()
    puts "Woohoo! You are a Winner!"
    exit(1)
  end
end

## This is when the player dies and should be something funny.
class Death < Scene
  @@end_messages = ["Looks like you are a goner.", "You didn't make it, boohoo.",
      "Womp womp, game over for you.", "So long! Better luck next time."]

  def enter()
    puts @@end_messages[rand(3)]
    exit(1)
  end
end

## This is the starting point and has a Gothon already standing there.
## Player must defeat the Gothon with a joke before continuing.
class CentralCorridor < Scene
  def enter()
    puts "Gothons from Planet Percal #25 have invaded your spaceship."
    puts "You are the last surviving member of your crew."
    puts "You need to get to the laser weapons armory to get the neutron bomb,"
    puts "and escape after setting up the spaceship to explode."
    puts "-" * 10 
    puts "You run down the central corridor but a Gothon suddenly jumps out and blocks your path."
    puts "He's blocking the door to the Weapons Armory. Quick, do something before he attacks you!"

    print "> "

    action = $stdin.gets.chomp

    if action.include?("shoot") || action.include?("attack")
      puts "You whip out your space pistol and shoot the Gothon."
      puts "The bullet bounces harmlessly off its scaly skin."
      puts "The Gothon roars in rage and jumps on you."
      puts "You fight valiantly but are eaten."
      return 'death'
    elsif action.include?("hide") || action.include?("run")
      puts "You scream in terror and look for a place to hide."
      puts "You run back the way you came, trying to open a door, any door."
      puts "Unfortunately the doors are all in lock down mode."
      puts "As you struggle with a door, the Gothon reaches for its space blaster and shoots you."
      return 'death'
    elsif action.include?("joke")
      puts "You remember a joke in Gothonese you learned at the Space Academy."
      puts "You tell the Gothon: meebop loolee tudee bakee, newhee moo!"
      puts "The Gothon starts laughing uncontrollably, falling down to the ground in laughter."
      puts "You quickly run past the Gothon and open the Armory door."
      return 'laser_armory'
    else
      puts "Action is not recognized!"
      return 'central_corridor'
    end

  end
end

## This is where the hero gets a neutron bomb to blow up the ship.
## There is a keypad where the player has to guess the number for.
class LaserWeaponArmory < Scene
  def enter()
    puts "You duck into the Armory and quickly shut the door behind you."
    puts "You glance around for any Gothons, but the Armory is silent."
    puts "Walking toward the neutron bomb, you realize it is under a security container. There is a keypad on the lock."
    puts "The keypad takes 3 digits. You have 10 tries to guess the number before the bomb self-destructs."
    puts "> "

    guess = $stdin.gets.chomp
    password = "#{rand(9)}#{rand(9)}#{rand(9)}"
    try = 1

    while guess!= password && try <= 10
      puts "Buzz! Wrong passcode!"
      try += 1
      print "[Enter passcode]> "
      guess = $stdin.gets.chomp
    end

    if guess == password
      puts "The keypad turns green and the security container slowly opens with a hydraulic hiss."
      puts "You take the neutron bomb and run towards the bridge to set it up."
      return 'the_bridge'
    else
      puts "The keypad screen turns a deathly red, before a 10 second countdown starts."
      puts "You know you won't be able to get to the escape pods in time and sit there in shock."
      puts "Finally, there is a big flash and everything goes dark."
      return 'death'
    end

  end
end

## This is where the hero has a battle scene with a Gothon and places the bomb.
class TheBridge < Scene
  def enter()
    puts "You run onto the bridge with the neutron bomb."
    puts "A few Gothons are surprised and look at the bomb under your arm in fear."
    puts "They hold up their blasters but are wary of the bomb."
    print "Do you throw the bomb at them?"

    throw_bomb = $stdin.gets.chomp.downcase

    if throw_bomb == "yes" || throw_bomb == "y"
      puts "You throw the bomb towards the Gothons in a panic and run for the door."
      puts "As soon as you throw the bomb, one of the Gothons shoots a laser jet at you."
      puts "As you fall, you feel your life slip away as you see the Gothons rush to disassemble the bomb."
      puts "Your last comfort is knowing they will probably join you when the bomb detonates."
      return 'death'
    elsif throw_bomb == "no" || throw_bomb == "n"
      puts "You lift the bomb threateningly and back toward the door."
      puts "The Gothons circle you slowly getting closer but you place the bomb quickly."
      puts "You jump back through the door and lock it, shooting the lock to smithereens so they can't get out."
      puts "Now, you have to get out of here! Run for the escape pod!"
      return 'escape_pod'
    end
  end
end

## This is where the hero escapes, but only after guessing the right escape pod.
class EscapePod < Scene
  def enter()
    puts "You race toward the escape pods, you have to get off the ship before the bomb detonates!"
    puts "You get to the escape pod chamber and see that there are 5 pods. Only two are undamaged."
    puts "You're not sure which pods are still functional, but there's no time to check."
    puts "Which one will you take?"

    first_pod = rand(1..5)
    second_pod = rand(1..5)
    while second_pod = first_pod
      second_pod = rand(1..5)
    end
    print "[pod#]> "

    guess = $stdin.gets.chomp_to_i

    if guess == first_pod || guess == second_pod
      puts "You jump into pod %s and hit the eject button." %guess
      puts "The pod escapes into space, and heads back to planet Earth."
      puts "You look back and see the spaceship explode in a celebration of colors."
      puts "The Gothon ship nearby also goes up in flames."
      puts "You did it!"
      return 'win'
    else
      puts "You jump into pod %s and hit the eject button." %guess
      puts "The pod escapes out into space, then implodes as the hull ruptures."
      puts "You are crashed into space jam."
      return 'death'
    end

  end
end

## Game map
class Map
  @@scenes = {
    "central_corridor" => CentralCorridor.new(),
    "laser_armory" => LaserWeaponArmory.new(),
    "the_bridge" => TheBridge.new(),
    'escape_pod' =>EscapePod.new(),
    "death" => Death.new(),
    "win" => Win.new()
  }

  def initialize(start_scene)
    @start_scene = start_scene
  end

  ## next_scene takes a scene_name parameter,
  ## and returns an instance of the next scene
  def next_scene(scene_name)
    return @@scenes[scene_name]
  end

  ## opening scene calls the next_scene function
  ## with a parameter of @start_scene
  def opening_scene()
    return next_scene(@start_scene)
  end
end

a_map = Map.new('central_corridor')
an_engine = Engine.new(a_map)
an_engine.play()