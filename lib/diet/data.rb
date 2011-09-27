module BrighterPlanet
  module Diet
    module Data
      def self.included(base)
        base.col :diet_class_id
        base.col :proximity, :type => :float
        base.col :conventionality, :type => :float
        base.col :size, :type => :integer
        base.col :intensity, :type => :float
        base.col :red_meat_share, :type => :float
        base.col :poultry_share, :type => :float
        base.col :fish_share, :type => :float
        base.col :eggs_share, :type => :float
        base.col :nuts_share, :type => :float
        base.col :dairy_share, :type => :float
        base.col :cereals_and_grains_share, :type => :float
        base.col :fruit_share, :type => :float
        base.col :vegetables_share, :type => :float
        base.col :oils_and_sugars_share, :type => :float
        base.col :start_date, :type => :date
        base.col :end_date, :type => :date

        base.data_miner do
          process "pull in related orphans" do
            FoodGroup.run_data_miner!
          end
        end
      end
    end
  end
end