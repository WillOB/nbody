require "gosu"
require_relative "z_order"
require "./planet"

class NbodySimulation < Gosu::Window

  def initialize
    super(640, 640, false)
    self.caption = "NBody simulation"
    @background_image = Gosu::Image.new("images/space.jpg", tileable: true)
    @mercury = Planet.new("images/mercury.png", 0, 320, 400)
    @venus = Planet.new("images/venus.png", 0, 320, 320)
  end

  def update
  end

  def draw
    @background_image.draw(0, 0, ZOrder::Background)
    @mercury.draw
    @venus.draw
  end

  def button_down(id)
    close if id == Gosu::KbEscape
  end

end

window = NbodySimulation.new
window.show
