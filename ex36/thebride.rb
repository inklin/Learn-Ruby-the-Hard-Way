module Bride

  def Bride.start(item)
    puts "You picked #{item}."

    if item.include?("dress")
      Bride.dress_track()
    elsif item.include?("necklace")
      Bride.necklace_track()
    end
  end

  def Bride.dress_track()
    puts "You take the dress off the mannequin and try it on."
    puts "You start to feel itchy all over. Do you..."

    choices = ['take off the dress', 'ignore the itching']
    (1..choices.length).each do |number|
      puts "#{number}. %s" % choices[number-1]
    end

    print "You pick number: "
    choice = $stdin.gets.chomp

    if choice == "1"
      puts "The dress is too itchy, you take it off and put it back."
      puts "You take a look at the necklace instead."
      Bride.necklace_track()
    elsif choice == "2"
      dead('You get a fatal allergic reaction from an old dress.')
    else
      Bride.dress_track()
    end
  end

  def Bride.necklace_track()
    puts "You put the necklace on and admire yourself in a mirror."
    puts "Suddenly, you see a ghostly figure behind you."
    puts "You turn around and see the bride of Frankenstein!"

    print "Quick, pick a number between 1-10: "

    number = $stdin.gets.chomp.to_i

    if number.even?
      Bride.fight() 
    else
      dead("The bride takes you for her scientific experiments.")
    end
  end

  def Bride.fight()
    puts "You successfully dodge the bride's reaching arms."
    puts "Do you run or fight?"
    bride_alive = true
    bride_weak = false

    while bride_alive
      print "> "
      response = $stdin.gets.chomp

      if response == "run" && !bride_weak
        puts "You try to run."
        dead("The bride catches up to you and eats you alive.")
      elsif response == "run" && bride_weak
        bride_alive = false
        puts("You are able to successfully escape.")
        win("the bride")
      elsif response == "fight" && !bride_weak
        puts "You punch the bride in the face. She falls over."
        bride_weak = true
      elsif response == "fight" && bride_weak
        bride_alive = false
        puts "You punch the bride again and she disintegrates into a cloud of dust."
        win("the bride")
      end
    end
  end

end