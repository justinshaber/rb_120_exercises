class Adoption 
  attr_reader :adopt, :type, :name

  @@pet_inventory = Hash.new([])
  @@owners = {}


  def initialize(type, name)
    @type = type
    @name = name
    if type
      @@pet_inventory[type] += [name]
    else
      @@owners[name] = []
    end
  end

  def self.pet_inventory
    @@pet_inventory
  end

  def self.owners
    @@owners
  end
end

class Pet < Adoption
  def initialize(type, name)
    super
  end
end

class Owner < Adoption
  def initialize(name)
    super(nil, name)
  end

  def number_of_pets
    @@owners[name].size
  end
end

class Shelter < Adoption
  def initialize
  end

  def adopt(person, animal)
    @@owners[person.name] += [[animal.type, animal.name]]
    @@pet_inventory[animal.type] -= [animal.name]
  end

  def print_adoptions
    @@owners.each_pair do |name, pets|
      puts "#{name} has adopted the folowing pets:"
      pets.each do |info|
        puts "  a #{info[0]} named #{info[1]}"
      end
    end
  end
end

butterscotch = Pet.new('cat', 'Butterscotch')
pudding      = Pet.new('cat', 'Pudding')
darwin       = Pet.new('bearded dragon', 'Darwin')
kennedy      = Pet.new('dog', 'Kennedy')
sweetie      = Pet.new('parakeet', 'Sweetie Pie')
molly        = Pet.new('dog', 'Molly')
chester      = Pet.new('fish', 'Chester')

phanson = Owner.new('P Hanson')
bholmes = Owner.new('B Holmes')

puts Shelter.pet_inventory
puts Shelter.owners
puts ''

shelter = Shelter.new
shelter.adopt(phanson, butterscotch)
shelter.adopt(phanson, pudding)
shelter.adopt(phanson, darwin)
shelter.adopt(bholmes, kennedy)
shelter.adopt(bholmes, sweetie)
shelter.adopt(bholmes, molly)
shelter.adopt(bholmes, chester)

puts Shelter.pet_inventory
puts Shelter.owners
puts ''

shelter.print_adoptions
puts "#{phanson.name} has #{phanson.number_of_pets} adopted pets."
puts "#{bholmes.name} has #{bholmes.number_of_pets} adopted pets."

# Write the classes and methods that will be necessary to make this code run,
# and print the following output:

# P Hanson has adopted the following pets:
# a cat named Butterscotch
# a cat named Pudding
# a bearded dragon named Darwin

# B Holmes has adopted the following pets:
# a dog named Molly
# a parakeet named Sweetie Pie
# a dog named Kennedy
# a fish named Chester

# P Hanson has 3 adopted pets.
# B Holmes has 4 adopted pets.

=begin
Pets are created
The pets are stored in a shelter
The shelter adopts pets to owners

=end