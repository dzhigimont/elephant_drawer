require_relative 'line'

module ElephantDrawer

  # Plain representation of line
  class Rectangle
    include Drawable
    attr_accessor :horizontal_line, :vertical_line, :lines

    def initialize(coordinates, filler = 'x')
      @horizontal_line = Line.new([coordinates[0], coordinates[1], coordinates[2], coordinates[1]])
      @vertical_line = Line.new([coordinates[0], coordinates[1], coordinates[0], coordinates[3]])
      @lines = [@horizontal_line, @vertical_line]
      @lines << horizontal_line.offset(vertical_line.end_point.y - vertical_line.start_point.y)
      @lines << vertical_line.offset(horizontal_line.end_point.x - horizontal_line.start_point.x)
      @filler = filler
    end

    def draw(canvas)
      @lines.each { |line| line.draw(canvas) }
      self
    end

  end
end
