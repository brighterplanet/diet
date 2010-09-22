Feature: Diet Emissions Calculations
  The diet model should generate correct emission calculations

  Scenario Outline: Standard Calculations for diet classes
    Given a diet has "diet_class.name" of "<diet_class>"
    When emissions are calculated
    Then the emission value should be within "0.1" kgs of "<emission>"
    Examples:
      | diet_class | emission |
      |   standard |   2966.3 |
      |      vegan |   2016.8 |
      | vegetarian |   2362.0 |
