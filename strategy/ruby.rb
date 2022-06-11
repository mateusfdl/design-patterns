class Animal
  attr_accessor :fly_type

  def try_fly
    fly_type.fly
  end
end

class Dog < Animal
  def initialize
    @fly_type = CanotFly.new
  end
end

class Bird < Animal
  def initialize
    @fly_type = Fly.new
  end
end

class Fly
  def fly
    'Im flying'
  end
end

class CanotFly
  def fly
    'I cant fly'
  end
end

puts Dog.new.try_fly
puts Bird.new.try_fly
