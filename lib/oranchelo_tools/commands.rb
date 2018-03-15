require 'oranchelo_tools/commands/build'
require 'oranchelo_tools/commands/none'

module OrancheloTools
  module Commands

    def self.classes
      @classes ||= constants.select do |c|
        const_get(c).is_a?(Class) && (c !~ /Command/)
      end
    end

    def self.all
      classes.map { |c| Kernel.const_get("#{self}::#{c}") }
    end

    def self.names
      classes.map(&:to_s).map(&:downcase)
    end
  end
end
