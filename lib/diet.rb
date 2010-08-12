require 'emitter'

module BrighterPlanet
  module Diet
    extend BrighterPlanet::Emitter

    def self.diet_model
      if Object.const_defined? 'Diet'
        ::Diet
      elsif Object.const_defined? 'DietRecord'
        DietRecord
      else
        raise 'There is no diet model'
      end
    end
  end
end
