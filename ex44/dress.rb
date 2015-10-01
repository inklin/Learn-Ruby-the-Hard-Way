class DressScene
  def enter()
    puts "You take the dress off the mannequin and try it on."
    puts "You start to feel itchy all over. Do you..."

    choices = ['take off the dress', 'ignore the itching']
    (1..choices.length).each do |number|
      puts "#{number}. %s" % choices[number-1]
    end

    print "You pick number: "
    choice = $stdin.gets.chomp

    if choice == "1"
      puts "The dress is too itchy, you take it off and put it back."
      puts "You take a look at the necklace instead."
      return 'necklace'
    elsif choice == "2"
      dead('You get a fatal allergic reaction from an old dress.')
    else
      return 'dress'
    end
  end
end