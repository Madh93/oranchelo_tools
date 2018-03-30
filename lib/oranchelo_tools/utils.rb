require 'oranchelo_tools/utils/inflectable'

module OrancheloTools
  module Utils

    def base_class
      @base_class ||= name.split('::').last[0...-1]
    end

    def classes
      @classes ||= constants.select do |c|
        const_get(c).is_a?(Class) && (c !~ /#{base_class}/)
      end
    end

    def all
      classes.map { |c| Kernel.const_get("#{self}::#{c}") }
    end

    def names
      classes.map(&:to_s).map(&:downcase)
    end
  end
end
