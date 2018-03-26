require 'yaml'

module OrancheloTools
  class Builder

    def initialize(opts)
      @builds = {}
      configure(opts)
    end

    def run
    end

    private

    def configure(opts)
      if opts.from_file
        @builds = configure_with(opts.from_file)
        return
      end

      validate_options(opts)

      builds[opts.package] = {}
      builds[opts.package]['version'] = opts.version
      builds[opts.package]['sources'] = sources
    end

    def configure_with(filename)
      YAML.load_file(File.read(filename))
    rescue Errno::ENOENT
      puts 'YAML configuration file couldn\'t be found.'
      exit
    rescue Psych::SyntaxError
      puts 'YAML configuration file contains invalid syntax.'
      exit
    end

    def validate_options(opts)
      validate(opts.package, '--package')
      validate(opts.version, '--version')
    end

    def validate(option, name)
      return unless option.nil?
      puts "Argument '#{name}' is required!"
      exit
    end

    def sources
      @sources ||= 'https://github.com/OrancheloTeam/oranchelo-icon-theme/archive/'
    end

    attr_reader :builds
  end
end
