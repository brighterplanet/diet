  Feature: Diet Committee Calculations
    The diet model should generate correct committee calculations

  Scenario Outline: Standard Calculations for diet classes
    Given a diet has "diet_class.name" of "<diet_class>"
    When emissions are calculated
    Then the intensity committee should be close to <fuel>, +/-1
    Examples:
      | diet_class | intensity |
      |   standard |    2966.3 |
      |      vegan |    2016.8 |
      | vegetarian |    2362.0 |
