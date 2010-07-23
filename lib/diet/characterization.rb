require 'characterizable'

module BrighterPlanet
  module Diet
    module Characterization
      def self.included(base)
        base.send :include, Characterizable
        base.characterize do
          has :diet_class
          has :food_group_balance, :trumps => :diet_class
          has :size # TODO more standard unit?
          has :proximity, :measures => :percentage # impotent for now
          has :conventionality, :measures => :percentage # impotent for now
          has :start_date do |start_date|
            start_date.reveals :end_date
          end

          has :retirement, :hidden => true
        end
        base.add_implicit_characteristics
      end
    end
  end
end
