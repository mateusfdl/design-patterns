# Frozen_string_literal: true

# EnemyShipBuilding
class EnemyShipBuilding
  def order_the_ship(ship_type)
    make_enemy_ship(ship_type).tap do |ship|
      ship.make_ship
      ship.display_enemy_ship
      ship.follow_hero_ship
      ship.enemy_ship_shoots
    end
  end
end

# UFOEnemyShipBuilding
class UFOEnemyShipBuilding < EnemyShipBuilding
  def make_enemy_ship(ship_type)
    case ship_type
    when 'U'
      ship_parts_factory = UFOEnemyShipFactory.new
      enemy_ship = UFOEnemyShip.new(ship_parts_factory)
      enemy_ship.name = 'UFO Enemy Ship'
    when 'UB'
      ship_parts_factory = UFOBossEnemyShipFactory.new
      enemy_ship = UFOBossEnemyShip.new(ship_parts_factory)
      enemy_ship.name = 'UFO BOSS'
    end

    enemy_ship
  end
end

# UFOEnemyShipFactory
class UFOEnemyShipFactory
  def add_es_gun
    ESUFOGun.new
  end

  def add_es_engine
    ESUFOEngine.new
  end
end

# UFOBossEnemyShipFactory
class UFOBossEnemyShipFactory
  def add_es_gun
    ESUFOBossGun.new
  end

  def add_es_engine
    ESUFOBossEngine.new
  end
end

# EnemyShip
class EnemyShip
  attr_accessor :name, :engine, :weapon

  def follow_hero_ship
    puts "#{name} is following the hero at #{engine}"
  end

  def display_enemy_ship
    puts "#{name} is on the screen"
  end

  def enemy_ship_shoots
    puts "#{name} attacks and does #{weapon}"
  end

  def to_s
    "The #{name} has a top speed of #{engine} and an attack power of #{weapon}"
  end
end

# UFOEnemyShip
class UFOEnemyShip < EnemyShip
  attr_accessor :ship_factory

  def initialize(ship_factory)
    @ship_factory = ship_factory
  end

  def make_ship
    puts("Making enemy ship #{name}")

    self.engine = ship_factory.add_es_engine
    self.weapon = ship_factory.add_es_gun
  end
end

# UFOBossEnemyShip
class UFOBossEnemyShip < EnemyShip
  attr_accessor :ship_factory

  def initialize(ship_factory)
    @ship_factory = ship_factory
  end

  def make_ship
    puts("Making enemy ship #{name}")

    self.engine = ship_factory.add_es_engine
    self.weapon = ship_factory.add_es_gun
  end
end

# ESUFOEngine
class ESUFOEngine
  def to_s
    '1000 mph'
  end
end

# ESUFOGun
class ESUFOGun
  def to_s
    '20 damage'
  end
end

# ESUOFBossEngine
class ESUFOBossEngine
  def to_s
    '2000 mph'
  end
end

# ESUFOBossGun
class ESUFOBossGun
  def to_s
    '40 damage'
  end
end

make_ufos = UFOEnemyShipBuilding.new

the_grunt = make_ufos.order_the_ship('U')
the_boss = make_ufos.order_the_ship('UB')

puts the_grunt
puts the_boss
