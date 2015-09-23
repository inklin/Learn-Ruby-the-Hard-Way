filename = ARGV.first

file = open(filename)

puts "Here is the content for #{filename}: "
puts file.read

puts "Now we will close the file."
file.close