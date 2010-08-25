require 'diet'

class DietRecord < ActiveRecord::Base
  include Sniff::Emitter
  include BrighterPlanet::Diet
  belongs_to :diet_class

  falls_back_on :size => 2150, # kcal https://brighterplanet.sifterapp.com/projects/30/issues/456
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

  def active?
    end_date.nil? or end_date > Time.zone.today
  end

  def organic?
    conventionality and conventionality < 0.5
  end
  
  def local?
    proximity and proximity >= 0.5
  end
  
  def share_or_fallback(group)
    [ self, diet_class, self.class.fallback ].compact.grab { |i| i.send "#{group}_share" }
  end
  
  def size_or_fallback
    size || self.class.fallback.size
  end
end
