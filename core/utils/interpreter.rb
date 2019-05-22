require 'core/models/canvas'
require 'core/models/line'
require 'core/models/rectangle'
require 'core/models/bucket_fill'

module ElephantDrawer
  COMMANDS = {
      'C' => lambda { |opts| puts "Create canvas #{opts[0]} x #{opts[1]}"; Canvas.new(opts[0], opts[1]) },
      'L' => lambda { |opts| puts "Create line #{opts}"; Line.new(opts) },
      'R' => lambda { |opts| puts "Create rectangle #{opts}"; Rectangle.new(opts) },
      'B' => lambda { |opts| puts "Create bucket fill #{opts}";  BucketFill.new(opts[0], opts[1], opts[2]) }
  }.freeze

  class Interpreter
    def self.interpret(command, opts)
      raise 'Not supported command' unless COMMANDS[command.upcase]

      COMMANDS[command].call(opts)
    end
  end

end


