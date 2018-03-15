require 'oranchelo_tools/commands/command'

module OrancheloTools
  module Commands

    class None < Command
      def initialize
        super do |opts|
          opts.banner = "Usage: #{GEM_NAME} [options] [command [options]]"

          # Add options
          show_version_option(opts)
          show_help_option(opts)
        end
      end

      private

      def show_version_option(opts)
        opts.on('-v', '--version', "Show #{GEM_NAME} version") do
          puts VERSION
          exit
        end
      end

      def show_help_option(opts)
        opts.on('-h', '--help', 'Prints this help') do
          puts opts
          exit
        end
      end
    end
  end
end
