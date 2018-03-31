module OrancheloTools
  module Utils

    module Inflectable

      refine String do
        def demodulize
          empty? ? self : split('::').last
        end
      end
    end
  end
end
