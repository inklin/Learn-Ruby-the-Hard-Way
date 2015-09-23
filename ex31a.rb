puts "It's Halloween and you're watching a horror movie."
puts "There is a thump on the window. You..."
puts "1. Ignore the trick or treaters."
puts "2. Get scared and hide under your blankets."
puts "3. Go to the window to investigate."

decision = $stdin.gets.chomp

if decision == "1"
  puts "You ignore the sound and keep watching."
  puts "Now there is frantic knocking on the door! Do you..."

  puts "1. Call the cops! "
  puts "2. Pause the movie and open the door with candy."

  door = $stdin.gets.chomp 

  if door == "1"
    puts "You get reprimanded by the cops and your parents for a false alarm. Good job!"
  elsif door == "2"
    puts "Little kindergarten kids dressed up for Halloween yell Trick or Treat! Happy Halloween."
  end

elsif decision == "2"
  puts "You're hiding under your blankets. You can't hear anything except the movie."
  puts "Do you think it's safe to come back out? Y or N."

  blanket = $stdin.gets.chomp

  if blanket == 'Y'
    puts "You lift your blanket cover only to see a person with a Scream mask standing in your room."
    puts "What do you do?"

    puts "1. Tell your sibling to quit fooling around."
    puts "2. Cover the person with the blanket to distract them and yell for help."
    puts "3. Scream at the top of your lungs."

    mask = $stdin.gets.chomp

    if mask == "2" || mask == "3"
      puts "Your parents run into the room. You are exposed as a scaredy cat. Good job!"
    elsif mask == "1"
      puts "Your sibling says Happy Halloween!"
    end

  elsif blanket == 'N'
    puts "You stay under your blanket feeling scared all night and waste Halloween. Good job!"
  end

elsif decision == "3"
  puts "When you get to the window, a werewolf suddenly breaks through and eats you. Good job!"
end
