  Feature: Diet Committee Calculations
    The diet model should generate correct committee calculations

  Scenario Outline: Standard Calculations for diet classes
    Given a diet emitter
    And a characteristic "diet_class.name" of "<diet_class>"
    When the "intensity" committee is calculated
    Then the conclusion of the committee should be "<intensity>"
    Examples:
      | diet_class | intensity |
      |   standard |      3.78 |
      |      vegan |      2.57 |
      | vegetarian |      3.01 |
