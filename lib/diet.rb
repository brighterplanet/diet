module BrighterPlanet
  module Diet
    extend self

    def included(base)
      require 'cohort_scope'
      require 'falls_back_on'
      require 'falls_back_on/active_record_ext'

      require 'diet/carbon_model'
      require 'diet/characterization'
      require 'diet/data'
      require 'diet/summarization'

      base.send :include, BrighterPlanet::Diet::CarbonModel
      base.send :include, BrighterPlanet::Diet::Characterization
      base.send :include, BrighterPlanet::Diet::Data
      base.send :include, BrighterPlanet::Diet::Summarization
    end
    def diet_model
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
