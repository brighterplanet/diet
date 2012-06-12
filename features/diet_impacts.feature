Feature: Diet Emissions Calculations
  The diet model should generate correct emission calculations

  Background:
    Given a diet

  Scenario Outline: Standard Calculations for diet classes
    Given it has "diet_class.name" of "<diet_class>"
    And it is the year "2010"
    When impacts are calculated
    Then the amount of "carbon" should be within "0.01" of "<emission>"
    Examples:
      | diet_class | emission |
      |            |  3416.10 |
      |   standard |  3416.10 |
      | vegetarian |  2636.68 |
      |      vegan |  2274.36 |

  Scenario: Standard Calculations for size and shares
    Given it has "size" of "1000"
    And it has "red_meat_share" of "0.1"
    And it has "poultry_share" of "0.1"
    And it has "fish_share" of "0.1"
    And it has "eggs_share" of "0.1"
    And it has "nuts_share" of "0.1"
    And it has "dairy_share" of "0.1"
    And it has "cereals_and_grains_share" of "0.1"
    And it has "fruit_share" of "0.1"
    And it has "vegetables_share" of "0.1"
    And it has "oils_and_sugars_share" of "0.1"
    And it is the year "2010"
    When impacts are calculated
    Then the amount of "carbon" should be within "0.01" of "2021.37"
