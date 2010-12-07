module BrighterPlanet
  module Diet
    module Relationships
      def self.included(target)
        target.belongs_to :diet_class
      end
    end
  end
end
