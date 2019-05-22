module ElephantDrawer

  class Point
    attr_accessor :x, :y

    def initialize(coordinate_x, coordinate_y)
      @x = coordinate_x
      @y = coordinate_y
    end

    def +(other)
      Point.new(@x + other.x, @y + other.y)
    end
  end

  module Drawable
    def draw
      rescue NotImplementedError
    end
  end

  class Line
    include Drawable
    attr_accessor :start_point, :end_point

    def initialize(coordinates, filler = 'x')
      @coordinates = coordinates
      @start_point = Point.new(coordinates[0], coordinates[1])
      @end_point = Point.new(coordinates[2], coordinates[3])
      @filler = filler
    end

    def draw(canvas)
      if vertical?
        @start_point.y.upto(@end_point.y) do |y|
          canvas[y][@start_point.x] = @filler
        end
      else
        @start_point.x.upto(@end_point.x) do |x|
          canvas[@start_point.y][x] = @filler
        end
      end
      self
    end

    def offset(offset)
      if vertical?
        Line.new([@start_point.x + offset, @start_point.y, @end_point.x + offset, @end_point.y] )
      else
        Line.new([@start_point.x, @start_point.y + offset, @end_point.x, @end_point.y + offset] )
      end
    end

    def vertical?
      @start_point.x == @end_point.x
    end
  end
end

