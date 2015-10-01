require './basement.rb'
require './dress.rb'
require './necklace.rb'
require './merman.rb'
require './players.rb'
require './zombie.rb'
require './ending.rb'
require './enginemap.rb'

game_map = Map.new('basement')
game_engine = Engine.new(game_map)
game_engine.play()