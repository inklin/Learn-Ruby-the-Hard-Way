# create a function that takes two arguments
def cheese_and_crackers(cheese_count, boxes_of_crackers)
  # print the first argument in a string
  puts "You have #{cheese_count} cheeses!"
  # print the second argument in a string
  puts "You have #{boxes_of_crackers} boxes of crackers!"
  # print string
  puts "Man that's enough for a party!"
  # print string with an escape character for a new line
  puts "Get a blanket.\n"
end

# print string
puts "We can just give the function numbers directly:"
# call the cheese_and_crackers function with 20 and 30 as arguments
cheese_and_crackers(20, 30)


# print string
puts "OR, we can use variables from our script:"
# create a variable amount_of_cheese and assign it an integer value of 10
amount_of_cheese = 10
# create a variable amount_of_crackers and assign it an integer value of 50
amount_of_crackers = 50

# call cheese_and_crackers function, passing in the two variables as arguments
cheese_and_crackers(amount_of_cheese,amount_of_crackers)

# print string
puts "We can even do math inside too:"
# call cheese_and_crackers, passing in the computed value of 10 + 20 as the first argument
# and the computed value of 5 + 6 as the second argument
cheese_and_crackers(10 + 20, 5 + 6)

# print string
puts "And we can combine the two, variables and math:"

# call cheese and crackers, passing in the computed value of the amount_of_cheese variable
# added to 100 as the first argument, passing in the computed value of the amount_of_crackers
# variable added to 1000 as the second argument
cheese_and_crackers(amount_of_cheese + 100, amount_of_crackers + 1000)