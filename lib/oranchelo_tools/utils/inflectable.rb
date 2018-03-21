module OrancheloTools
  module Utils

    module Inflectable

      refine String do
        def demodulize
          empty? ? self : split('::').last.downcase
        end
      end
    end
  end
end
