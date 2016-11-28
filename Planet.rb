class Planet

  def initialize(image, mass, x, y)
    @image = Gosu::Image.new(image)
    @mass = mass
    @x = x
    @y = y
  end

  def draw
    @image.draw(@x, @y, ZOrder::Planet)
  end
  
end
