Feature: Search
  In order to find out what I should wear today
  As a user
  I want to search for my town

  Scenario: Main Page
    When I go to the homepage
    Then I should see 'What should I wear today?'
    
  Scenario: Search with many results
    Given I am on the homepage
    When I fill in "query" with "London"
    And I press "submit"
    Then I should see a list of possible cities