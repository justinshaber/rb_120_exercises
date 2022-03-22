class Cat
  attr_accessor :name

  @@total = 0

  def initialize(name)
    @name = name
    @@total += 1
  end

  def self.total
    puts "total: #{@@total}"
  end

  def self.generic_greeting
    puts "Hello, I'm a cat!"
  end

  def personal_greeting
    puts "Hello, I'm #{name}!"
  end

end

# Cat.generic_greeting
kitty1 = Cat.new("Sophie")
Cat.total
kitty2 = Cat.new("Boberta")
Cat.total

