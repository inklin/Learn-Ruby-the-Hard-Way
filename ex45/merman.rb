class MermanScene

  def enter()
    puts "You feel a damp sensation in your shoes. Do you look down?"

    look = ""

    while !(look == "yes" || look == "no")
      print "> "
      look = $stdin.gets.chomp.downcase
    end

    if look == "yes"
      fight()
    elsif look == "no"
      puts "You ignore the sensation. The merman sneaks up behind you..."
      puts "You have been devoured by the merman."
      return 'dead'
    end
  end

  def fight()
    puts "A merman is creeping towards you on the carpet."
    puts "It's shaped like a large bloated fish, with razor sharp teeth."
    puts "It looks a bit silly, flopping on the carpet with its fins."

    puts "Do you:"
    puts "1. Run up the stairs."
    puts "2. Laugh at the merman."
    puts "3. Break the sea shell."

    fight_choice = $stdin.gets.chomp

    if fight_choice == "1"
      climb_stairs()
    elsif fight_choice == "2"
      puts "You laugh but the Merman jumps up and eats you alive."
      return 'dead'
    elsif fight_choice == "3"
      puts "You break the seashell and the merman lets out a loud wail."
      return 'finish'
    else
      puts "You debate your decision too long and the merman slowly inches closer."
      puts "Suddenly, he jumps on you and gobbles you up!"
      return 'dead'
    end
  end

  def climb_stairs()
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
      return 'finish'
    else
      puts "You trip while running up the stairs and tumble down."
      puts "The merman eagerly gobbles you up."
      return 'dead'
    end
  end

end