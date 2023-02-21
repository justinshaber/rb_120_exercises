class FixedArray
  attr_accessor :fixed_array, :fixed_array_size

  def initialize(size)
    # @fixed_array = []
    # @fixed_array_size = size
    # set_array(fixed_array_size)

    @fixed_array = Array.new(size)
  end

  def set_array(size)
    size.times do
      fixed_array << nil
    end
  end

  def [](idx)
    # validate_idx(idx)
    # fixed_array[idx]
    fixed_array.fetch(idx)
  end

  def []=(idx, elem)
    self[idx]
    # validate_idx(idx)
    fixed_array[idx] = elem
  end

  def validate_idx(idx)
    raise IndexError unless (0..fixed_array_size).include?(idx.abs)
  end

  def to_a
    # fixed_array

    fixed_array.clone
  end

  def to_s
    # "#{fixed_array}"

    to_a.to_s
  end
end

fixed_array = FixedArray.new(5)
puts fixed_array[3] == nil
puts fixed_array.to_a == [nil] * 5

fixed_array[3] = 'a'
puts fixed_array[3] == 'a'
puts fixed_array.to_a == [nil, nil, nil, 'a', nil]

fixed_array[1] = 'b'
puts fixed_array[1] == 'b'
puts fixed_array.to_a == [nil, 'b', nil, 'a', nil]

fixed_array[1] = 'c'
puts fixed_array[1] == 'c'
puts fixed_array.to_a == [nil, 'c', nil, 'a', nil]

fixed_array[4] = 'd'
puts fixed_array[4] == 'd'
puts fixed_array.to_a == [nil, 'c', nil, 'a', 'd']
# false
puts fixed_array.to_s == '[nil, "c", nil, "a", "d"]'

puts fixed_array[-1] == 'd'
puts fixed_array[-4] == 'c'

begin
  fixed_array[6]
  puts false
rescue IndexError
  puts true
end

begin
  fixed_array[-7] = 3
  puts false
rescue IndexError
  puts true
end

begin
  fixed_array[7] = 3
  puts false
rescue IndexError
  puts true
end