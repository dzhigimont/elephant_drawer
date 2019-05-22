require_relative 'line'
require 'forwardable'

module ElephantDrawer

  class Canvas
    include Drawable
    extend Forwardable
    attr_accessor :width, :height
    attr_reader :matrix

    V_FILLER = '|'.freeze
    H_FILLER = '-'.freeze

    def_delegators :@matrix, :[], :<<, :size, :each

    def initialize(width, height)
      @width = width
      @height = height
      @matrix = Array.new(height + 2) { Array.new(width + 2) }
      fill_frame
    end

    def fill_frame
      each.with_index do |row, i|
        if i.zero? || i == (size - 1)
          row.fill(H_FILLER)
        else
          row[0] = V_FILLER
          row[row.size - 1] = V_FILLER
        end
      end
    end

    def draw(figure)
      figure.draw(self) if figure.is_a?(Drawable)
      self
    end

    def to_s
      result = ''
      each do |r|
        result << r.map { |e| e.nil? ? ' ' : e }.join('')
        result << "\n"
      end
      result
    end
  end
end


