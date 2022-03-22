class Vehicles
  attr_reader :make, :model

  def initialize(make, model)
    @make = make
    @model = model
  end

  def to_s
    "#{make} #{model}"
  end

  def wheels
    self.class::WHEELS
  end
end

class Car < Vehicles
  WHEELS = 4
end

class Motorcycle < Vehicles
  WHEELS = 2
end

class Truck < Vehicles
  WHEELS = 6
  attr_reader :payload

  def initialize(make, model, payload)
    super(make, model)
    @payload = payload
  end
end

myCar = Car.new("toyota", "camery")
puts myCar.wheels