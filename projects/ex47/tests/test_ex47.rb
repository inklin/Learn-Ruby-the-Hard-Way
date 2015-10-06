require "./lib/ex47/game.rb"
require "test/unit"

class TestName < Test::Unit::TestCase

  def test_room()
    gold = Room.new("GoldRoom",
      """This room has gold in it you can grab. There's alias_method 
      door to the north.""")
    assert_equal(gold.name, "GoldRoom")
    assert_equal(gold.paths, {})
  end

  def test_room_paths()
    center = Room.new("Center", "Test room in the center.")
    north = Room.new("North", "Test room in the north.")
    south = Room.new("South", "Test room in the south.")

    center.add_paths({'north' => north, 'south' => south})
    assert_equal(center.go('north'), north)
    assert_equal(center.go('south'), south)
  end


  def test_map()
    start = Room.new("Start", "You can go west and down a hole.")
    west = Room.new("Trees", "There are trees here, you can go east.")
    down = Room.new("Dungeon", "It's dark down here, you can go up.")

    start.add_paths({'west' => west, 'down' => down})
    west.add_paths({'east' => start})
    down.add_paths({'up' => start})

    assert_equal(start.go('west'), west)
    assert_equal(start.go('west').go('east'), start)
    assert_equal(start.go('down').go('up'), start)
  end

  def test_game()
    # Integration test --> a series of steps 
    basement = Room.new("BasementScene", "You can go to Dress.")
    dress = Room.new("DressScene", "You can go to Necklace, Dress, or Lose.")
    necklace = Room.new("NecklaceScene", "You can go to Zombie or Lose.")
    zombie = Room.new("ZombieScene", "You can go to Merman or Lose.")
    merman = Room.new("MermanScene", "You can go to Lose or Finish")
    lose = Room.new("Lose", "You have lost the game. Nowhere to go.")
    finish = Room.new("Finish", "You have won the game. Nowhere to go.")

    # from basement, can only go to dress
    basement.add_paths({'dress' => dress})
    # from dress, can go to necklace, dress, or lose
    dress.add_paths({'necklace' => necklace, 'dress' => dress, 'lose' => lose})
    # from necklace, can go to zombie, or lose
    necklace.add_paths({'zombie' => zombie, 'lose' => lose})
    # from zombie, can go to merman or lose
    zombie.add_paths({'merman' => merman, 'lose' => lose})
    # from merman, can go to lose or finish
    merman.add_paths({'lose' => lose, 'finish' => finish})
    ## lose and finish do not have paths to any other rooms

    # test that basement goes to dress, goes to dress, goes to lose
    assert_equal(basement.go('dress').go('dress').go('lose'), lose)
    # test that dress goes to necklace goes to lose
    assert_equal(dress.go('necklace').go('lose'), lose)
    # test that necklace goes to zombie, goes to lose
    assert_equal(necklace.go('zombie').go('lose'), lose)
    # test that zombie goes to merman, goes to lose
    assert_equal(zombie.go('merman').go('lose'), lose)
    # test that merman goes to finish
    assert_equal(merman.go('finish'), finish)
  end

end