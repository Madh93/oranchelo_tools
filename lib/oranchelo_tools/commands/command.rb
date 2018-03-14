require 'optparse'

module OrancheloTools
  module Commands

    class Command < OptionParser

      attr_accessor :args

      def initialize
        super
      end
    end
  end
end
