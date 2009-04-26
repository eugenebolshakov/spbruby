Feature: Display Next Easter Date
  So that I know when to celebrate
  As a pious person
  I should be able to find out the next Easter date

  Scenario: Easter has not come yet this year
    Given today is "18 April 2009"
    When I go to "the homepage"
    Then I should see "Orthodox Easter is coming in 1 day"

  Scenario: Easter has passed already
    Given today is "20 April 2009"
    When I go to "the homepage"
    Then I should see "Orthodox Easter has passed this year"
    And I should see "Next Easter date is 4 April 2010"
