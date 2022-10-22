=begin
What output does this code print? Fix this class so that there are no surprises waiting in store for the unsuspecting developer.
=end

class Pet
  attr_reader :name

  def initialize(name)
    p name.class
    @name = name.to_s
  end

  def to_s
    # @name.upcase!
    "My name is #{@name.upcase}."
  end
end

name = 'Fluffy'
fluffy = Pet.new(name)
puts fluffy.name
puts fluffy
puts fluffy.name
puts name

# name = 42
# fluffy = Pet.new(name)
# name += 1
# puts fluffy.name
# puts fluffy
# puts fluffy.name
# puts name