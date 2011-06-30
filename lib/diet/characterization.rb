module BrighterPlanet
  module Diet
    module Characterization
      def self.included(base)
        base.characterize do
          has :diet_class
          has :red_meat_share
          has :poultry_share
          has :fish_share
          has :eggs_share
          has :nuts_share
          has :dairy_share
          has :cereals_and_grains_share
          has :fruit_share
          has :vegetables_share
          has :oils_and_sugars_share
          has :size # TODO more standard unit?
          has :proximity
          has :conventionality
          has :start_date
          has :end_date
        end
      end
    end
  end
end
