class Dead
  def enter()
    puts "Game over!"
    exit(0)
  end
end

class Finish
  def enter()
    puts "You successfully survived. You win!"
    exit(0)
  end
end