class Vehicle
  def vehicle_wheels
    puts "#{self.class.name} has #{wheels} wheels"
  end

  def vehicle_height
    puts "#{self.class.name} has #{height} pounds"
  end

  attr_accessor :wheels, :height
end

class Car < Vehicle
  def initialize
    @wheels = 4
    @height = '1500'
    super
  end
end

class Truck < Vehicle
  def initialize
    @wheels = 6
    @height = '9000'
    super
  end
end

class Factory
  def build(type)
    @klass = type.new
  end

  attr_accessor :klass
end

[Truck, Car].each do |type|
  klass = Factory.new.build(type)
  klass.vehicle_height
  klass.vehicle_wheels
end
