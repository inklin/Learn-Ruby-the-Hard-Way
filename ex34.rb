puts "1. The 2nd animal is at 1 is a ruby."
puts "2. The third animal is at 2 and is a peacock."
puts "3. The first animal is at 0 and is a bear."
puts "4. The 4th animal is at 3 and is a kangaroo."
puts "5. The fifth animal is at 4 and is a whale."
puts "6. The sixth animal is at 5 and is a playtypus."
puts "8. The 5th animal is at 4 and is a whale."

def check_place(ordinal)
  animals = ['bear', 'ruby', 'peacock', 'kangaroo', 'whale', 'playtypus']
  if ordinal >= 1 && ordinal <= animals.length
    puts "The # #{ordinal} animal is %s and is at #{ordinal-1}." % animals[ordinal-1]
  else
    puts "You entered an invalid number!"
  end
end

check_place(1)
check_place(2)
check_place(3)
check_place(4)
check_place(5)
check_place(6)

fairy_tales = ['Cinderella', 'Snow White', 'Hansel & Gretel', 'Beauty and the Beast']

puts "The first fairy tale is #{fairy_tales[0]}."
puts "The second fairy tale is #{fairy_tales[1]}."
puts "The third fairy tale is #{fairy_tales[2]}."
puts "The fourth fairy tale is #{fairy_tales[3]}."
