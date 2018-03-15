require 'optparse'

module OrancheloTools
  module Commands

    class Command < OptionParser

      attr_accessor :args

      def self.to_s
        name.split('::').last.downcase
      end

      def initialize
        super
      end

      def empty?
        args.values.all?(&:nil?)
      end
    end
  end
end
