class Pet
  attr_reader :type, :name

  def initialize(type, name, shelter)
    @type = type
    @name = name
    shelter.intake_pet(self)
  end

  def to_s
    "  a #{self.type} named #{self.name}"
  end
end

class Owner
  attr_reader :name 
  attr_accessor :owners_pets

  def initialize(name)
    @name = name
    @owners_pets = []
  end

  def number_of_pets
    self.owners_pets.size
  end
end

class Shelter
  attr_accessor :list_of_owners, :list_of_pets

  def initialize
    @list_of_owners = {}
    @list_of_pets = []
  end

  def intake_pet(pet)
    list_of_pets << pet
  end

  def remove_pet(pet)
    self.list_of_pets -= [pet]
  end

  def adopt(owner, pet)
    list_of_owners[owner] = true
    owner.owners_pets << pet
    self.remove_pet(pet)
  end

  def print_adoptions
    puts "The Animal Shelter has the following unadopted pets:"
    list_of_pets.each do |pet|
      puts pet
    end

    list_of_owners.each_key do |owner|
      puts "#{owner.name} has adopted the following pets:"
      owner.owners_pets.each do |pet|
        puts pet
      end
    end
  end

  def number_of_pets
    list_of_pets.size
  end
end

shelter = Shelter.new

butterscotch = Pet.new('cat', 'Butterscotch', shelter)
pudding      = Pet.new('cat', 'Pudding', shelter)
darwin       = Pet.new('bearded dragon', 'Darwin', shelter)
kennedy      = Pet.new('dog', 'Kennedy', shelter)
sweetie      = Pet.new('parakeet', 'Sweetie Pie', shelter)
molly        = Pet.new('dog', 'Molly', shelter)
chester      = Pet.new('fish', 'Chester', shelter)
asta         = Pet.new('dog', 'Asta', shelter)
laddie       = Pet.new('dog', 'Laddie', shelter)
fluffy       = Pet.new('cat', 'fluffy', shelter)
kat          = Pet.new('cat', 'Kat', shelter)
ben          = Pet.new('cat', 'Ben', shelter)
chatterbox   = Pet.new('parakeet', 'chatterbox', shelter)
bluebell     = Pet.new('parakeet', 'Bluebell', shelter)

phanson = Owner.new('P Hanson')
bholmes = Owner.new('B Holmes')

shelter.adopt(phanson, butterscotch)
shelter.adopt(phanson, pudding)
shelter.adopt(phanson, darwin)
shelter.adopt(bholmes, kennedy)
shelter.adopt(bholmes, sweetie)
shelter.adopt(bholmes, molly)
shelter.adopt(bholmes, chester)

shelter.print_adoptions

puts "#{phanson.name} has #{phanson.number_of_pets} adopted pets."
puts "#{bholmes.name} has #{bholmes.number_of_pets} adopted pets."
puts "The Animal shelter has #{shelter.number_of_pets} unadopted pets."