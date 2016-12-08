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
    @planets_ary = []
    @systemSize = planets[1].to_f

    planets.each do |line|
      line = line.split(' ')
      if line.length > 1 && line[-1].include?(".png")
        x = 320 + line[0].to_f / @systemSize * 320
        y = 320 + line[1].to_f / @systemSize * 320
        @planets_ary.push(Planet.new(x, y, line[2], line[3], line[4], line[5]))
      end
    end
  end

  def update
    n = @planets_ary.length
    @planets_ary.each do |planet|
      n.times do
        num = 0
        planet.calculate_force(@planets_ary[num])
        num += 1
      end
    end

    @planets_ary.each do |planet|
      planet.move(@systemSize)
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
