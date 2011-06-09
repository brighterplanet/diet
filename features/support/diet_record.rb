require 'diet'

class DietRecord < ActiveRecord::Base
  include Sniff::Emitter
  include BrighterPlanet::Diet
end
