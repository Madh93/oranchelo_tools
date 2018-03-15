module OrancheloTools
  module Utils

    module Inflectable

      refine String do
        def demodulize
          split('::').last.downcase
        end
      end
    end
  end
end
