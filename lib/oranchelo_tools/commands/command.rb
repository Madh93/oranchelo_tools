require 'oranchelo_tools/utils/inflectable'
require 'optparse'

module OrancheloTools
  module Commands

    class Command < OptionParser
      using OrancheloTools::Utils::Inflectable

      attr_accessor :args

      def self.to_s
        name.demodulize
      end

      def initialize
        super
      end

      def empty?
        args.values.all?(&:nil?)
      end

      def name
        self.class.name.demodulize
      end
    end
  end
end
