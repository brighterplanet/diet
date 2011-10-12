Feature: Diet Emissions Calculations
  The diet model should generate correct emission calculations

  Background:
    Given a diet

  Scenario Outline: Standard Calculations for diet classes
    Given it has "diet_class.name" of "<diet_class>"
    When impacts are calculated
    Then the amount of "carbon" should be within "0.1" kgs of "<emission>"
    Examples:
      | diet_class | emission |
      |   standard |   2966.3 |
      |      vegan |   2016.8 |
      | vegetarian |   2362.0 |
