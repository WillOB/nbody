require "gosu"
require_relative "z_order"
require "./planet"

class NbodySimulation < Gosu::Window

#  def create_planets
    # simulation = File.open("simulations/planets.txt")
    # planets = simulation.read.lines
    # planets_ary = []
    # planets.each do |line|
    #   line.split(' ')
    #   if line.length > 1
    #     x = line[0]
    #     y = line[1]
    #     xvel = line[2]
    #     yvel = line[3]
    #     mass = line[4]
    #     image = line[5]
    #     planets_ary.push(Planet.new(x, y, xvel, yvel, mass, image))
    #   end
    # end
  #  return planets_ary
  #end

  def initialize
    super(640, 640, false)
    self.caption = "NBody simulation"
    @background_image = Gosu::Image.new("images/space.jpg", tileable: true)
    simulation = open("simulations/planets.txt")
    planets = simulation.read.lines
    planets_ary = []
    planets.each do |line|
      line.split(' ')
      if line.length > 1
        x = line[0]
        y = line[1]
        xvel = line[2]
        yvel = line[3]
        mass = line[4]
        image = line[5]
        planets_ary.push(Planet.new(x, y, xvel, yvel, mass, image))
      end
    end
    @planets_ary = planets_ary
    #@sun = Planet.new(320, 320, 0, 0, 5, "images/sun.png")
    #@mercury = Planet.new("images/mercury.png", 0, 320, 262)
    #@venus = Planet.new("images/venus.png", 0, 320, 212)
    #@earth = Planet.new("images/earth.png", 0, 320, 170)
    #@mars = Planet.new("images/mars.png", 0, 320, 92)
  end

  def update
  end

  def draw
    @background_image.draw(0, 0, ZOrder::Background)
    planets_ary.each do |planet|
      planet.draw
    end
    #@sun.draw
    #@mercury.draw
    #@venus.draw
    #@earth.draw
    #@mars.draw
  end

  def button_down(id)
    close if id == Gosu::KbEscape
  end

end

window = NbodySimulation.new
window.show

#to-do: redo arguments, create a method to read simulations, scale stuff
