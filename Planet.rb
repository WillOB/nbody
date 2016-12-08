require "gosu"

class Planet

  attr_accessor :x, :y, :mass

  def initialize(x, y, xvel, yvel, mass, image)
    @x = x
    @y = y
    @xvel = xvel.to_f
    @yvel = yvel.to_f
    @mass = mass.to_f
    @image = Gosu::Image.new("images/" + image)
    @forcex = 0
    @forcey = 0
    @accx = 0
    @accy = 0
  end

  def calculate_force(otherPlanet)
    r = Math.sqrt((@x - otherPlanet.x)**2 + (@y - otherPlanet.y)**2)
    force = G * @mass * otherPlanet.mass / r**2
    @forcex += force * (@x - otherPlanet.x) / r
    @forcey += force * (@y - otherPlanet.y) / r
  end

  def move(systemSize)
    @accx = @forcex / @mass
    @accy = @forcey / @mass
    @xvel += @accx * 25000
    @yvel += @accy * 25000
    @x += @xvel * 25000 / systemSize * 320 #look at these lines
    @y += @yvel * 25000 / systemSize * 320
  end

  def draw
    @image.draw(@x.to_f, @y.to_f, ZOrder::Planet)
  end

end
