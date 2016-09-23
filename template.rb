# Below is an example of the Template Method design pattern.

class Animal
  def describe
    say_species
    make_sound
  end

  def say_species
    raise "Implement say_species"
  end

  def make_sound
    raise "Implement make_sound"
  end
end

class Dog < Animal
  def say_species
    puts "Doggie!"
  end

  def make_sound
    puts "Woof!"
  end
end

class Cat < Animal
  def say_species
    puts "Kitty!"
  end

  def make_sound
    puts "Meow!"
  end
end

lollipop = Dog.new
puts lollipop.describe

kitty = Cat.new
puts kitty.describe