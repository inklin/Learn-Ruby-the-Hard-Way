class Dead
  def enter()
    puts "Game over."
    exit(0)
  end
end

class Finish
  def enter()
    puts "You successfully survived all the Bride of Frankenstein, the Zombie and the Merman. You win!"
    exit(0)
  end
end