def is_even(number1, number2)
  puts "Is #{number1} an even number? #{number1 % 2 == 0}"
  puts "Is #{number2} an even number? #{number2 % 2 == 0}"
end

number6 = 6
number7 = 7

is_even(3, 5)
is_even(2 + 5, 1 + 8)
is_even(5.0 / 2, 6.0 / 2)
is_even(number6, number7)
is_even(number6 + 5, number7 + 11)
is_even(5 * 10, 2 * 7)
is_even(5 + 10 - 3, 1)
is_even(10 % 3, 6 % 2)
is_even(2 ** 3, 1 ** 100)

puts "Enter a number please:"
first_number = gets.chomp.to_i
puts "Now enter another number:"
second_number = gets.chomp.to_i

is_even(first_number, second_number)