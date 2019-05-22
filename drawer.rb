require 'core/utils/interpreter'
require 'core/utils/parser'

module ElephantDrawer

  class Drawer
    def initialize(input, output)
      @input = input
      @output = output
      @objects = []
      @canvas = nil
    end

    def run
      input_output do |row, out|
        command, opts = Parser.parse(row)
        object = Interpreter.interpret(command, opts)
        if object.is_a?(Canvas)
          raise 'You must specify canvas first' if @objects.any? && !@canvas

          @canvas ||= object
          puts @canvas
          out.write(@canvas.to_s)
        else
          puts @canvas.draw(object)
          out.write(@canvas.to_s)
        end
      end
    end

    def input_output
      begin
        File.open(@output, 'wt') do |out|
          File.open(@input, 'rt').each_line do |row|
            yield(row, out)
          end
        end
      rescue StandardError => e
        puts 'Something wrong...'
        puts e
      end
    end
  end

end

# Run command => ruby -I. drawer.rb tmp/input.txt tmp/output.txt

ElephantDrawer::Drawer.new(ARGV[0], ARGV[1]).run if $PROGRAM_NAME == __FILE__
