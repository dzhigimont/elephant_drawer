module ElephantDrawer
  class Parser
    def self.parse(line)
      opts = []
      row = line.split(' ')
      command = row.shift
      row.each do |str|
        begin
          opts << Integer(str)
        rescue StandardError
          opts << str
        end
      end
      [command, opts]
    end
  end
end
