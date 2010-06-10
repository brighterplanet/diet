module BrighterPlanet
  module Diet
    def self.included(base)
      base.extend ::Leap::Subject
      base.decide :emission, :with => :characteristics do
        committee :emission do # returns kg CO2
          quorum 'from intensity and size', :needs => [:intensity, :size, :active_subtimeframe] do |characteristics|
            #( grams CO2 / kcal food   ) * (   kcal food         )
            (characteristics[:intensity] * characteristics[:size]).grams.to(:kilograms) * characteristics[:active_subtimeframe].days
          end
          quorum 'default' do
            raise 'Diet emission committee default quorum should never be called'
          end
        end
    
        committee :intensity do # returns grams CO2 / kcal food
          quorum 'from food group balance', :needs => :food_group_balance do |characteristics|
            FoodGroup.names.collect do |group|
              characteristics[:food_group_balance]["#{group}_share".to_sym] * FoodGroup.find_by_name(group).intensity
            end.sum
          end
    
          quorum 'from diet class', :needs => :diet_class do |characteristics|
            characteristics[:diet_class].intensity
          end
          
          quorum 'default' do
            fallback.intensity
          end
        end
    
        committee :size do # returns kcal food
          quorum 'default' do
            fallback.size
          end
        end
    
        committee :diet_class do
          quorum 'default' do
            DietClass.fallback
          end
        end
    
        committee :active_subtimeframe do
          quorum 'from start and end dates', :needs => [:start_date, :end_date] do |characteristics, timeframe|
            Timeframe.constrained_new characteristics[:start_date], characteristics[:end_date], timeframe
          end
        end
        
        committee :start_date do
          quorum 'from end date', :appreciates => :end_date do |characteristics, timeframe|
            [ timeframe.from, characteristics[:end_date] ].compact.min
          end
        end
        
        committee :end_date do
          quorum 'from start date', :appreciates => :start_date do |characteristics, timeframe|
            [ timeframe.to, characteristics[:start_date] ].compact.max
          end
        end
      end
    end
  end
end
