module Walkable
  def walk
    puts "Let's go for a walk =]"
  end
end

class Cat
  include Walkable

  attr_accessor :name
  attr_reader :age, :color

  def initialize (name, color, age)
    @name = name
    @color = color
    @age = age
  end

  def speak
    puts "Meowlo world! I'm #{name}!"
  end

  def info
    "#{name} is a #{age} year old #{color} cat."
  end
end

kitty = Cat.new("Ellie", "white", 5)
kitty.speak
kitty.walk
