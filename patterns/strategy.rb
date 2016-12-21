# Below is an example of the Strategy design pattern.
# Examples: rdoc parsers

class Animal
  attr_accessor :species

  def initialize(species)
    @species = species
  end

  def describe
    @species.make_sound
  end
end

class Dog
  def make_sound
    puts "Woof! Woof!"
  end
end

class Cat
  def make_sound
    puts "Meeeee-owwwwww."
  end
end

your_pet = Animal.new(Cat.new)
your_pet.describe

my_pet = Animal.new(Dog.new)
my_pet.describe
