class Engine

  def initialize(story_map)
    @story_map = story_map
  end

  def play()
    current_scene = @story_map.opening_scene()
    last_scene = @story_map.next_scene('finish')

    while current_scene != last_scene
      next_scene_name = current_scene.enter()
      current_scene = @story_map.next_scene(next_scene_name)
    end

    current_scene.enter()
  end

end

class Map
  @@scenes = {
    'basement' => BasementScene.new(),
    'dress' => DressScene.new(),
    'necklace' => NecklaceScene.new(),
    'zombie' => ZombieScene.new(),
    'merman' => MermanScene.new(),
    'dead' => Dead.new(),
    'finish' => Finish.new()
  }

  def initialize(start_scene)
    @start_scene = start_scene
  end

  def next_scene(scene_name)
    new_scene = @@scenes[scene_name]
    return new_scene
  end

  def opening_scene()
    return next_scene(@start_scene)
  end

end