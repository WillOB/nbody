require "gosu"
G = 6.67259e-11


class Planet

  attr_accessor :x, :y, :mass, :image

  def initialize(x, y, xvel, yvel, mass, image)
    @x = x.to_f
    @y = y.to_f
    @xvel = xvel.to_f
    @yvel = yvel.to_f
    @mass = mass.to_f
    @image = Gosu::Image.new("images/" + image)
    @forcex = @forcey = @accx = @accy = @xscaled = @yscaled = 0
  end

  def draw
    @image.draw(@xscaled - image.width / 2, @yscaled - image.height / 2, ZOrder::Planet)
  end

  def calculate_force(otherPlanet)
    r = Math.sqrt((@x - otherPlanet.x)**2 + (@y - otherPlanet.y)**2)
    force = G * @mass * otherPlanet.mass / r**2
    @forcex -= force * (@x - otherPlanet.x) / r
    @forcey -= force * (@y - otherPlanet.y) / r
  end

  def move(systemSize)
    @accx = @forcex / @mass
    @accy = @forcey / @mass
    @forcex = @forcey = 0
    @xvel += @accx * 25000
    @yvel += @accy * 25000
    @x += @xvel * 25000
    @y += @yvel * 25000
    @xscaled = @x / systemSize * 320 + 320
    @yscaled = -@y / systemSize * 320 + 320
  end



end
