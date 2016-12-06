require "gosu"
require_relative "z_order"
require "./planet"
G = 6.67259e-11

class NbodySimulation < Gosu::Window

#  def create_planets
# simulation = open("simulations/planets.txt")
# planets = simulation.read.lines
# planets_ary = []
# systemSize = planets[1].to_f
# planets.each do |line|
#   line = line.split(' ')
#   if line.length > 1 && line[-1].include?(".png")
#     x = 320 + line[0].to_f / systemSize * 320
#     y = 320 + line[1].to_f / systemSize * 320
#     xvel = line[2].to_f
#     yvel = line[3].to_f
#     mass = line[4].to_f
#     image = line[5]
#     planets_ary.push(Planet.new(x, y, xvel, yvel, mass, "images/" + image))
#   end
# end
  #end

  def initialize
    super(640, 640, false)
    self.caption = "NBody simulation"
    @background_image = Gosu::Image.new("images/space.jpg", tileable: true)
    simulation = open("simulations/planets.txt")
    planets = simulation.read.lines
    planets_ary = []
    systemSize = planets[1].to_f
    planets.each do |line|
      line = line.split(' ')
      if line.length > 1 && line[-1].include?(".png")
        x = 320 + line[0].to_f / systemSize * 320
        y = 320 + line[1].to_f / systemSize * 320
        xvel = line[2].to_f
        yvel = line[3].to_f
        mass = line[4].to_f
        image = line[5]
        planets_ary.push(Planet.new(x, y, xvel, yvel, mass, "images/" + image))
      end
    end
    @planets_ary = planets_ary
  end

  def update
    # @planets_ary.each do |planet|
    #   planet.calculate_force
    # end
    n = @planets_ary.length
    @planets_ary.each do |planet|
      n.times do
        num = 0
        distancex = (planet.x - @planets_ary[num].x).abs
        newFx = G * planet.mass * @planets_ary[num].mass / (distancex**2)
        planet.forcex += newFx
        distancey = (planet.y - @planets_ary[num].y).abs
        newFy = G * planet.mass * @planets_ary[num].mass / (distancey**2)
        planet.forcey += newFy
        num += 1
      end
    end

    @planets_ary.each do |planet|
      planet.accx = planet.mass / planet.forcex
      planet.accy = planet.mass / planet.forcey
      planet.xvel += planet.accx * 25000
      planet.yvel += planet.accy * 25000
      planet.x += planet.xvel * 25000
      planet.y += planet.yvel * 25000
    end

  end

  def draw
    @background_image.draw(0, 0, ZOrder::Background)
    @planets_ary.each do |planet|
      planet.draw
    end
  end

  def button_down(id)
    close if id == Gosu::KbEscape
  end

end

window = NbodySimulation.new
window.show
