module Merman

  def Merman.start()
    puts "You put the shell to your ear and hear ocean waves."
    puts "What is that? A faint scream in between crashing waves..."
    puts "You feel a damp sensation in your shoes. Do you look down?"

    look = $stdin.gets.chomp.downcase

    if look == "yes" || look == "y"
      Merman.fight()
    elsif look == "no" || look == "n"
      puts "You ignore the sensation. The merman sneaks up behind you..."
      dead("You have been devoured by the merman.")
    end
  end

  def Merman.fight()
    puts "A merman is creeping towards you on the carpet."
    puts "It's shaped like a large bloated fish, with razor sharp teeth."
    puts "It looks a bit silly, flopping on the carpet with its fins."

    puts "Do you:"
    puts "1. Run up the stairs."
    puts "2. Laugh at the merman."
    puts "3. Break the sea shell."

    fight_choice = $stdin.gets.chomp

    if fight_choice == "1"
      Merman.stairs()
    elsif fight_choice == "2"
      dead("You laugh but the Merman jumps up and eats you alive.")
    elsif fight_choice == "3"
      puts("You break the seashell and the merman lets out a loud wail.")
      win("the merman")
    end
  end

  def Merman.stairs()
    puts "There are 20 steps to the top of the stairs."
    steps = []

    (1..3).each do |number|
      puts "How many steps do you take for step ##{number}?"

      step = $stdin.gets.chomp.to_i
      steps.push(step)
    end

    total = steps.inject(0, :+)

    if total == 20
      puts "You fly up the stairs while the merman flops helplessly at the bottom."
      win("the merman")
    else
      dead("You trip while running up the stairs and tumble down.")
      dead("The merman eagerly gobbles you up.")
    end
  end

end