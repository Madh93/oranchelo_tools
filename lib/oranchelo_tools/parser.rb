require 'oranchelo_tools/commands'

module OrancheloTools
  module Parser

    def self.parse(options)
      # Get available commands
      commands = {}
      OrancheloTools::Commands.all.each do |cmd|
        commands[cmd.to_s] = cmd.new
      end

      # Parse default command
      commands['none'].order!(options)

      # Parse built-in commands
      if (command = commands[options.shift])
        command.order!(options)
        return [command.name, command.args] unless command.empty?
        puts command.help
      else
        puts commands['none'].help
      end

      exit
    end
  end
end
