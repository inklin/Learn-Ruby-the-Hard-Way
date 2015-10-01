class BasementScene
  def enter()
    puts "You are staying in a cabin in the woods for a weekend trip."
    puts "After hiking all day, you and your friends decide to relax in the basement."
    puts "There is an assortment of items around."

    pick_items()
  end

  def pick_items()
    puts "On a mannequin, there is a vintage wedding dress and a gorgeous necklace."
    puts "On a table, there is a conch shell."
    puts "Beside the shell, there is an old dusty diary."
    puts "Which do you you look at first?"

    item = $stdin.gets.chomp 

    if item.include?("necklace")
      return 'necklace'
    elsif item.include?("dress")
      return 'dress'
    elsif item.include?("conch") || item.include?("shell")
      return 'merman'
    elsif item.include?("diary")
      return 'zombie'
    else
      puts "You didn't pick any of the items."
      puts "You're so boring that your friends kick you out of the house."
      return 'dead'
    end
  end 
end