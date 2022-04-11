class Something
  def initialize
    @data = 'Hello'
  end

  def dupdata
    @data + @data
  end

  def self.dupdata
    'ByeBye'
  end
end

puts "Expected output:"
puts 'ByeBye'
puts 'HelloHello'
puts

puts "Actual output:"
thing = Something.new
puts Something.dupdata
puts thing.dupdata