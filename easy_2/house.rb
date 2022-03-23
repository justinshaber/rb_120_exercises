class House
  include Comparable
  attr_reader :price

  def <=>(other)
    self.price.to_i <=> other.price.to_i
  end

  def initialize(price)
    @price = price
  end
end

home1 = House.new(100_000)
home2 = House.new(150_000)
puts home1
puts "Home 1 is cheaper" if home1 < home2
puts "Home 2 is more expensive" if home2 > home1

# Home 1 is cheaper
# Home 2 is more expensive