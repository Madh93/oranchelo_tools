require 'oranchelo_tools/builder'
require 'oranchelo_tools/commands'
require 'oranchelo_tools/version'

require 'logging'

# Logging root level config
Logging.logger.root.appenders = Logging.appenders.stdout
Logging.logger.root.level = :debug

module OrancheloTools
  GEM_NAME = 'oranchelo_tools'.freeze
  PACKAGE_NAME = 'oranchelo-icon-theme'.freeze
  THEME_NAME = 'Oranchelo Icon Theme'.freeze

  def self.logger
    @logger ||= Logging.logger[self]
  end
end
