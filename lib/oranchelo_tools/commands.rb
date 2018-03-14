require 'oranchelo_tools/commands/build'

module OrancheloTools
  module Commands

    def self.classes
      @classes ||= constants.select { |c| const_get(c).is_a? Class }
    end

    def self.all
      classes.map { |c| Kernel.const_get("#{self}::#{c}") }
    end

    def self.names
      classes.map(&:to_s).map(&:downcase)
    end
  end
end
