require "gosu"
require_relative "z_order"
require "./planet"

class NbodySimulation < Gosu::Window

  def initialize
    super(640, 640, false)
    self.caption = "NBody simulation"
    @background_image = Gosu::Image.new("images/space.jpg", tileable: true)
    @sun = Planet.new("images/sun.png", 0, 320, 320)
    @mercury = Planet.new("images/mercury.png", 0, 320, 262)
    @venus = Planet.new("images/venus.png", 0, 320, 212)
    @earth = Planet.new("images/earth.png", 0, 320, 170)
    @mars = Planet.new("images/mars.png", 0, 320, 92)
  end

  def update
  end

  def draw
    @background_image.draw(0, 0, ZOrder::Background)
    @sun.draw
    @mercury.draw
    @venus.draw
    @earth.draw
    @mars.draw
  end

  def button_down(id)
    close if id == Gosu::KbEscape
  end

end

window = NbodySimulation.new
window.show

#to-do: redo arguments, create a method to read simulations, scale stuff
