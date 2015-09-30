class Parent

  ## defines a function implicit 
  def implicit()
    puts "PARENT implicit()"
  end

  ## defines a function override
  def override()
    puts "PARENT override()"
  end

  ## defines a function altered
  def altered()
    puts "PARENT altered()"
  end
end

class Child < Parent

  ## defines a function override, 
  ## this function overrides the class Parent's override function
  def override()
    puts "CHILD override()"
  end

  ## defines a function altered, 
  ## this function overrides the class Parent's altered function
  def altered()
    puts "CHILD, BEFORE PARENT altered()"
    ## call the super method in the Parent class
    super()
    puts "CHILD, AFTER PARENT altered()"
  end
end

dad = Parent.new()
son = Child.new()

# from dad, get the implicit method and call it
dad.implicit()
# from son, get the implicid method and call it 
# (this method is inherited from the Parent class)
son.implicit()

# from dad, get the override method and call it
dad.override()
# from son, get the override method and call it
son.override()

# from dad, get the altered method and call it
dad.altered()
# from son, get the altered method and call it
son.altered()