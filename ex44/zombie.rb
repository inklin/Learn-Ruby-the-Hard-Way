class ZombieScene
  def enter()
    @zombie = Zombie.new()
    @player = Player.new()

    puts "A chill fills the air and you look up to see that the window is open."
    puts "You walk over to close the window but a rotting hand reaches in!"
    puts "It's a zombie! The zombie looks like a little girl, but she's missing an arm."

    fight_or_flight()
  end

  def fight_or_flight()
    puts "The zombie crawls through the window, you're too late."
    puts "Your friends scream and scramble up the stairs."
    puts "You can't run, the zombie is on you. You must fight back!"

    while (@zombie.health > 0)
      print "Rest or fight? > "
      choice = $stdin.gets.chomp.downcase

      ## If player decides to rest, health is improved
      if choice == "rest"
        @player.rest()
        puts "You rested and now have #{@player.health} health points."
      ## If player decides to fight, attack the zombie
      elsif choice == "fight"
        @player.attack(@zombie)

        ## If the attack killed the zombie, move to Merman scene
        if (@zombie.health <= 0)
          puts "You successfully beat the zombie to a pulp!"
          return 'merman'
        end

        ## If the attack did not kill the zombie, update player with zombie health
        puts "You attacked the zombie! It has #{@zombie.health} points left."
      ## If player did not pick fight or rest, player does nothing this turn.
      else 
        puts "You don't do anything."
      end

      ## Zombie's turn to attack!
      @zombie.attack(@player)

      ## If the zombie attack killed the player, return 'dead'
      if (@player.health <= 0)
        puts "You have been devoured by the zombie."
        return 'dead'
      end

      ## If the player survived the zombie attack, give update on health
      puts "You have #{@player.health} points left."
    end

  end


end