module BrighterPlanet
  module Diet
    module Fallback
      def self.included(base)
        base.falls_back_on :size => 2150, # kcal https://brighterplanet.sifterapp.com/projects/30/issues/456
                           :red_meat_share => 0.0958, # https://brighterplanet.sifterapp.com/projects/30/issues/654/comments
                           :poultry_share => 0.0416,
                           :fish_share => 0.0059,
                           :eggs_share => 0.0098,
                           :nuts_share => 0.0209,
                           :dairy_share => 0.1116,
                           :cereals_and_grains_share => 0.2453,
                           :fruit_share => 0.0367,
                           :vegetables_share => 0.0514,
                           :oils_and_sugars_share => 0.3811
      end
    end
  end
end
   