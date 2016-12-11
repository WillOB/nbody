require "gosu"
require_relative "z_order"
require "./planet"


class NbodySimulation < Gosu::Window

  def initialize(simulation)
    super(640, 640, false)
    self.caption = "NBody simulation"
    @background_image = Gosu::Image.new("images/space.jpg", tileable: true)
    simulation = open(simulation)

    planets = simulation.read.lines
    @planets_ary = []
    @systemSize = planets[1].to_f
    create_planets(planets)
  end

  def create_planets(planets)
    planets.each do |line|
      line = line.split(' ')
      if line.length > 1 && line[-1].include?(".png")
        @planets_ary.push(Planet.new(line[0], line[1], line[2], line[3], line[4], line[5]))
      end
    end
  end

  def update
    @planets_ary.each do |planet|

      @planets_ary.each do |otherPlanet|
        if planet.image != otherPlanet.image
          planet.calculate_force(otherPlanet)
        end
      end

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

if ARGV.length == 0
  simulation = "simulations/planets.txt"
else
  simulation = "simulations/" + ARGV[0].to_s
end

window = NbodySimulation.new(simulation)
window.show
