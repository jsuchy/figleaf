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
    Then I should see the weather report for "London" # This needs fleshing out to see which info we are returning
  
  
  
