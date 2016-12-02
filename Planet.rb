require "gosu"
class Planet

  def initialize(x, y, xvel, yvel, mass, image)
    @image = Gosu::Image.new(image)
    @mass = mass
    @x = x
    @y = y
    @xvel = xvel
    @yvel = yvel
  end

  def draw
    @image.draw(@x, @y, ZOrder::Planet)
  end

end
