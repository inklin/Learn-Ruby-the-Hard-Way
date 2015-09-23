require "./thebride.rb"
require "./merman.rb"

def start
  puts "You are staying in a cabin in the woods for a weekend trip."
  puts "After hiking all day, you and your friends decide to relax in the basement."
  puts "There is an assortment of items around."
  puts "Do you want to take a look at them? yes or no"

  examine_items = $stdin.gets.chomp.downcase

  if examine_items == "yes"
    pick_items
  elsif examine_items == "no"
    puts "You sit around doing nothing."
    puts "Your friend gets bored and says 'Hey, let's check out some of this stuff!'"
    pick_items
  end

end

def pick_items
  puts "On a mannequin, there is a vintage wedding dress and a gorgeous necklace."
  puts "On a table, there is a conch shell."
  puts "Which do you you look at first?"

  item = $stdin.gets.chomp 

  if item.include?("necklace") || item.include?("dress")
    Bride.start(item)
  elsif item.include?("conch") || item.include?("shell")
    Merman.start()
  else
    puts "You didn't pick any of the items."
    dead("You'e so boring that your friends kick you out of the house.")
  end
end 

def win(monster_killed)
  puts "You successfully faced off against #{monster_killed}. You win!"
  exit(0)
end

def dead(reason)
  puts reason << " Game over!"
  exit(0)
end

start