def range_loop(increment, upper_limit)

  numbers = []
  for number in (0...upper_limit)
    puts "The number is : #{number}"
    numbers.push(number)
  end

  puts "The numbers:"

  for number in numbers
    puts number
  end
end

range_loop(1, 6)