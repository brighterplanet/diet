module BrighterPlanet
  module Diet
    module Data
      def self.included(base)
        base.force_schema do
          string   'diet_class_id'
          float    'proximity'
          float    'conventionality'
          integer  'size'
          float    'intensity'
          float    'red_meat_share'
          float    'poultry_share'
          float    'fish_share'
          float    'eggs_share'
          float    'nuts_share'
          float    'dairy_share'
          float    'cereals_and_grains_share'
          float    'fruit_share'
          float    'vegetables_share'
          float    'oils_and_sugars_share'
          date     'start_date'
          date     'end_date'
        end

        base.data_miner do
          process "pull in related orphans" do
            FoodGroup.run_data_miner!
          end
        end
      end
    end
  end
end
