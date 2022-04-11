# Write the classes and methods that will be necessary to make this code run,
# and print the following output:

# The Animal Shelter has the following unadopted pets:
# a dog named Asta
# a dog named Laddie
# a cat named Fluffy
# a cat named Kat
# a cat named Ben
# a parakeet named Chatterbox
# a parakeet named Bluebell

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
# The Animal shelter has 7 unadopted pets.










=begin
Each pet could be initialized with a variable for who owns it.

Pet
  Init with type and name
    if no home...then it's in nature

Owner
  Init with one name
  Number of pets
Shelter
  Init
  adopt (owner, pet name)
    remove from shelter
    add to owner
  pet inventory
=end

############################################

# module Adoptable
#   def adopt(owner = nil, animal)
#     #if no owner, then add the animal to the shelter
#     #if owner, 
#     if owner
#       # remove from shelter, add to owner.
#     else
      
#     end
#   end
# end

# class Pet
#   include Adoptable

#   attr_reader :type, :name

#   def initialize(type, name)
#     @type = type
#     @name = name
#   end
# end

# class Shelter
#   include Adoptable

#   attr_reader :pet_inventory

#   def initialize
#     @pet_inventory = Hash.new([])
#   end
# end

# class Owner
#   attr_reader :name
  
#   def initialize(name)
#     @name = name
#   end
# end

############################################

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

shelter = Shelter.new
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

##################################

# local_shelter = Shelter.new

# butterscotch = Pet.new('cat', 'Butterscotch')
# pudding      = Pet.new('cat', 'Pudding')
# darwin       = Pet.new('bearded dragon', 'Darwin')
# kennedy      = Pet.new('dog', 'Kennedy')
# sweetie      = Pet.new('parakeet', 'Sweetie Pie')
# molly        = Pet.new('dog', 'Molly')
# chester      = Pet.new('fish', 'Chester')

# local_shelter.adopt(butterscotch)
# local_shelter.adopt(pudding)
# local_shelter.adopt(darwin)
# local_shelter.adopt(kennedy)
# local_shelter.adopt(sweetie)
# local_shelter.adopt(molly)
# local_shelter.adopt(chester)




# phanson = Owner.new('P Hanson')
# bholmes = Owner.new('B Holmes')

# puts Shelter.pet_inventory
# puts Shelter.owners
# puts ''

# local_shelter.adopt(phanson, butterscotch)
# local_shelter.adopt(phanson, pudding)
# local_shelter.adopt(phanson, darwin)
# local_shelter.adopt(bholmes, kennedy)
# local_shelter.adopt(bholmes, sweetie)
# local_shelter.adopt(bholmes, molly)
# local_shelter.adopt(bholmes, chester)

# puts Shelter.pet_inventory
# puts Shelter.owners
# puts ''

# shelter.print_adoptions
# puts "#{phanson.name} has #{phanson.number_of_pets} adopted pets."
# puts "#{bholmes.name} has #{bholmes.number_of_pets} adopted pets."