require "gosu"

class Planet

  attr_accessor :x, :y, :mass, :xvel, :yvel, :forcex, :forcey, :accx, :accy

  def initialize(x, y, xvel, yvel, mass, image)
    @image = Gosu::Image.new(image)
    @mass = mass
    @x = x
    @y = y
    @xvel = xvel
    @yvel = yvel
    @forcex = 0
    @forcey = 0
    @accx = 0
    @accy = 0
  end

  # def calculate_force
  #   n = planets_ary.length
  #   @planets_ary.each do |planet|
  #     n times do
  #       x = 0
  #       newF = G * planet.mass * planets_ary[x].mass / (@x**2 + @y**2)
  #       x += 1
  #       @force += newF
  #     end
  #   end
  #   puts @force
  # end

  def draw
    @image.draw(@x, @y, ZOrder::Planet)
  end

end
