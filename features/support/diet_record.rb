require 'diet'

class DietRecord < ActiveRecord::Base
  include BrighterPlanet::Emitter
  include BrighterPlanet::Diet
end
