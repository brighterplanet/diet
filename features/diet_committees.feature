  Feature: Diet Committee Calculations
    The diet model should generate correct committee calculations

  Background:
    Given a diet

  Scenario Outline: Intensity committee from diet class
    Given a characteristic "diet_class.name" of "<diet_class>"
    When the "intensity" committee reports
    Then the conclusion of the committee should be "<intensity>"
    Examples:
      | diet_class | intensity |
      |   standard |      3.78 |
      |      vegan |      2.57 |
      | vegetarian |      3.01 |

  Scenario Outline: Intensity committee from  food groups
    Given a characteristic "red_meat_share" of "<meat>"
    And a characteristic "poultry_share" of "<poultry>"
    And a characteristic "fish_share" of "<fish>"
    And a characteristic "eggs_share" of "<eggs>"
    And a characteristic "nuts_share" of "<nuts>"
    And a characteristic "dairy_share" of "<dairy>"
    And a characteristic "cereals_and_grains_share" of "<cereals>"
    And a characteristic "fruit_share" of "<fruit>"
    And a characteristic "vegetables_share" of "<veg>"
    And a characteristic "oils_and_sugars_share" of "<oil>"
    When the "intensity" committee reports
    Then the committee should have used quorum "from food groups"
    And the conclusion of the committee should be "<intensity>"
    Examples:
      | meat | poultry | fish | eggs | nuts | dairy | cereals | fruit | veg | oil | intensity |
      | 0.1  | 0.1     | 0.1  | 0.1  | 0.1  | 0.1   | 0.1     | 0.1   | 0.1 | 0.1 | 5         |
