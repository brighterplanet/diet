module BrighterPlanet
  module Diet
    module Characterization
      def self.included(base)
        base.characterize do
          has :diet_class
          has :red_meat_share, :trumps => :diet_class
          has :poultry_share, :trumps => :diet_class
          has :fish_share, :trumps => :diet_class
          has :eggs_share, :trumps => :diet_class
          has :nuts_share, :trumps => :diet_class
          has :dairy_share, :trumps => :diet_class
          has :cereals_and_grains_share, :trumps => :diet_class
          has :fruit_share, :trumps => :diet_class
          has :vegetables_share, :trumps => :diet_class
          has :oils_and_sugars_share, :trumps => :diet_class
          has :size # TODO more standard unit?
          has :proximity, :measures => :percentage # impotent for now
          has :conventionality, :measures => :percentage # impotent for now
          has :start_date do |start_date|
            start_date.reveals :end_date
          end
        end
      end
    end
  end
end
