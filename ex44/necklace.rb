class NecklaceScene

  def enter()
    puts "You put the necklace on and admire yourself in a mirror."
    puts "Suddenly, you see a ghostly figure behind you."
    puts "You turn around and see the bride of Frankenstein!"

    print "Quick, pick a number between 1-10: "

    number = $stdin.gets.chomp.to_i

    if number.even?
      fight() 
    else
      puts "The bride grabs you and takes you for her crazy experiments."
      return 'dead'
    end
  end

  def fight()
    puts "You successfully dodge the bride's reaching arms."
    puts "Do you run or fight?"
    bride_alive = true
    bride_weak = false

    while bride_alive
      print "> "
      response = $stdin.gets.chomp

      if response == "run" && !bride_weak
        puts "You try to run."
        puts "The bride catches up to you and eats you alive."
        return 'dead'
      elsif response == "run" && bride_weak
        bride_alive = false
        puts "You are able to successfully escape."
        return 'finish'
      elsif response == "fight" && !bride_weak
        puts "You punch the bride in the face. She falls over."
        bride_weak = true
      elsif response == "fight" && bride_weak
        bride_alive = false
        puts "You punch the bride again and she disintegrates into a cloud of dust."
        return 'finish'
      else
        puts "Make a choice!> "
        response = $sdin.gets.chomp
      end
    end
  end

end