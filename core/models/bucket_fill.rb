require_relative 'line'

module ElephantDrawer
  class BucketFill
    include Drawable
    def initialize(x, y, filler)
      @point = Point.new(x, y)
      @filler = filler
    end

    def draw(canvas)
      flood_fill(canvas, Array.new(canvas.size) { Array.new(canvas[0].size) }, @point.y, @point.x)
      self
    end

    private

    def flood_fill(canvas, visited, y, x)
      return if y < 1 || y >= canvas.size || x < 1 || x >= canvas[0].size

      return if visited[y][x]

      visited[y][x] = true

      return if canvas[y][x]

      canvas[y][x] = @filler
      flood_fill(canvas, visited, y + 1, x)
      flood_fill(canvas, visited, y - 1, x)
      flood_fill(canvas, visited, y, x + 1)
      flood_fill(canvas, visited, y, x - 1)

    end
  end
end

