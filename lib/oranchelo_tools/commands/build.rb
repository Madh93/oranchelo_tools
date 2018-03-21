require 'oranchelo_tools/commands/command'

module OrancheloTools
  module Commands

    class Build < Command
      def initialize
        super do |opts|
          opts.banner = "Usage: #{GEM_NAME} #{name} [options]"

          # Add options
          specify_package_option(opts)
          specify_version_option(opts)
          show_help_option(opts)
        end

        # Set available arguments
        self.args = Struct.new(:package, :version).new
      end

      private

      def specify_package_option(opts)
        opts.on('-p', '--package=TYPE', 'Target package type') do |p|
          args.package = p
        end
      end

      def specify_version_option(opts)
        opts.on('-v', '--version=VERSION', "#{THEME_NAME} release version") do |v|
          args.version = v
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
