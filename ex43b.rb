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
    exit(1)
  end
end

class Market < Scene
  def enter()
    puts "You have entered the Market Scene."
    return 'forest'
  end
end

class Forest < Scene
  def enter()
    puts "You have entered the Forest Scene."
    return 'inn'
  end
end

class Inn < Scene
  def enter()
    puts "You have entered the Inn Scene."
    return 'castle'
  end
end

class Castle < Scene
  def enter()
    puts "You have entered the Castle Scene."
    return 'finish'
  end
end

class Lose < Scene
  def enter()
    puts "You have lost, oh no."
    exit(1)
  end
end

class Finish < Scene
  def enter()
    puts "Finished scene."
    exit(1)
  end
end

class Map
  @@scenes = {
    'market' => Market.new(),
    'forest' => Forest.new(),
    'inn' => Inn.new(),
    'castle' => Castle.new(),
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

game_map = Map.new('market')
game_engine = Engine.new(game_map)
game_engine.play()