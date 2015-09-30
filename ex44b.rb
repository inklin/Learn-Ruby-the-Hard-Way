class Other

  def override()
    puts "OTHER override()"
  end

  def implicit()
    puts "OTHER implicit()"
  end

  def altered()
    puts "OTHER altered()"
  end
end

class Child

  def initialize()
    # create a new instance of Other
    # assign it to the instance variable @other
    @other = Other.new()
  end

  def implicit()
    # from @other, get the implicit function and call it
    @other.implicit()
  end

  def override()
    puts "CHILD override()"
  end

  def altered()
    puts "CHILD, BEFORE OTHER altered()"
    # from @other, get the altered function and call it
    @other.altered()
    puts "CHILD, AFTER OTHER altered()"
  end
end

daughter = Child.new()

daughter.implicit()
daughter.override()
daughter.altered()