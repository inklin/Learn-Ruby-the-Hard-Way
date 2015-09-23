superhero1, superhero2, superhero3 = ARGV

puts "What superpower does #{superhero1} have?"
power1 = $stdin.gets.chomp
puts "What superpower does #{superhero2} have?"
power2 = $stdin.gets.chomp
puts "What superpower does #{superhero3} have?"
power3 = $stdin.gets.chomp

puts "#{superhero1} has the power of #{power1}."
puts "#{superhero2} has the power of #{power2}."
puts "#{superhero3} has the power of #{power3}."
