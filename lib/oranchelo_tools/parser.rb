require 'oranchelo_tools/commands'

module OrancheloTools
  module Parser

    def self.parse(options)
      logger.debug "Parsing command-line arguments. Arguments: '#{options.join(' ')}'"

      @options = options

      # Parse default command
      commands['none'].order!(options)

      # Parse built-in commands
      if (command = commands[options.shift])
        return parse_subcommand(command)
      else
        logger.debug 'Unknown command passed'
        show_help(commands['none'])
      end
    end

    def self.parse_subcommand(command)
      logger.debug "Parsing '#{command.name}' subcommand"

      command.order!(options)
      return [command.name, command.args] unless command.empty?
      logger.debug 'Unknown arguments passed'
      show_help(command)
    end

    def self.show_help(command)
      puts command.help
      exit
    end

    def self.commands
      @commands ||= available_commands
    end

    def self.available_commands
      commands = {}
      OrancheloTools::Commands.all.each do |cmd|
        commands[cmd.to_s] = cmd.new
      end
      commands
    end

    def self.logger
      @logger ||= Logging.logger[self]
    end

    class << self
      attr_reader :options
    end
  end
end
