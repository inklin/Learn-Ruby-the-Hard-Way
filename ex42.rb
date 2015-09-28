## Animal is-a object
class Animal

  def animal?()
    true
  end

  def say_hello(sound=nil)
    puts "#{sound} #{sound}"
  end

  attr_reader :name
end

## Dog is-a Animal
class Dog < Animal

  def initialize(name)
    ## Dog has-a name
    @name = name
  end

  def say_hello()
    super("woof")
  end
end

## Cat is-a Animal
class Cat < Animal

  def initialize(name)
    ## Cat has-a name
    @name = name
  end

  def say_hello()
    super("meow")
  end

end

## Person is-a object
class Person

  def initialize(name)
    ## Person has-a name
    @name = name

    ## Person has-a pet of some kind
    @pet = nil

    ## Person has-a list of hobbies
    @hobbies = []

    ## Dietary Preferences
    @preferences = {}
  end

  attr_accessor :pet, :hobbies, :preferences

  def describe()
    puts "This person's name is #{@name}."
    puts "#{@name}'s hobbies include:"

    @hobbies.each { |hobby| puts hobby}

    puts "#{@name}'s food preferences are:"

    @preferences.each { |key, value| puts "#{key}: #{value}"}

    puts "#{@name} has a pet named #{@pet.name}." unless @pet.nil?
  end
end

## Employee is-a Person
class Employee < Person

  def initialize(name, salary)
    # when you invoke super,
    # Ruby sends a message to the parent of the current object
    # the current object is Employee and the parent is Parent
    
    # it asks it to invoke a method of the same name as 
    # the method invoking super (in this case, the method name is initialize)
    # the arguments that were passed to the method are automatically forwarded
    # here, the argument name is forwarded to the higher up method, Person initialize method
    super(name)
    ## Person has-a salary
    @salary = salary
  end

end

## Fish is-a object
class Fish
end

## Salmon is-a Fish
class Salmon < Fish
end

## Halibut is-a Fish
class Halibut < Fish
end


## rover is-a Dog
rover = Dog.new("Rover")

## paws is-a Cat
paws = Cat.new("Paws")

## mary is-a Person
mary = Person.new("Mary")

## mary has-a pet paws
mary.pet = paws

## mary has knitting, running, scuba diving as her hobbies
mary.hobbies = ['knitting', 'running', 'scuba diving']

## mary's dietary preferences
mary.preferences = {'coffee' => 'dark roast', 'eggs' => 'sunny side up', 'steak' => 'well done'}

mary.describe()

## frank is-a Employee
frank = Employee.new("Frank", 120000)

## frank has-a pet rover
frank.pet = rover

## frank's dietary preferences
frank.preferences = {'coffee' => 'medium roast', 'eggs' => 'over easy', 'steak' => 'blue'}

## flipper is-a Fish
flipper = Fish.new()

## crouse is-a Salmon
crouse = Salmon.new()

## harry is-a Halibut
harry = Halibut.new()