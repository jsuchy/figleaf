Feature: Weather report
  In order to know what I should wear today
  As a user
  I want to see the weather report

  Scenario: Report
    Given I am on the homepage
    When I fill in "location" with "London"
    And I press "search"
    Then I should see the cities for "London"
    When I follow "London, United Kingdom"
    Then I should see "6:17 AM"
    And I should see "Mist"
    And I should see "29.45"
    And I should see "NNW"

  Scenario: Bad location
    Given a search for "badlocation" returns no results
    When I go to the display weather page for "badlocation"
    Then I should be on the homepage
    And I should see an error message
  
  
  