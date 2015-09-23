# Assign integer values to the three variables
people = 30
cars = 40
trucks = 15

# if cars is greater than people (the integer values)
if cars > people
  # print this line
  puts "We should take the cars."
# otherwise, if cars is less than people
elsif cars < people
  # print this line
  puts "We should not take the cars."
# if both of the above cases are not true, print this line
else
  puts "We can't decide."
end

# if trucks are greater than cars
if trucks > cars
  # print this line
  puts "That's too many trucks."
# otherwise, if trucks are less than cars
elsif trucks < cars
  # print this line
  puts "Maybe we could take the trucks."
# if neither of the above two scenarios are true,
else
  # print this line
  puts "We still can't decide"
end

# if people are greater than trucks
if people > trucks
  # print this line
  puts "Alright, let's just take the trucks."
# otherwise, print this line
else
  puts "Fine, let's stay home then."
end