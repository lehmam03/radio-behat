Feature: Search
  In order to see a word definition
  As a website user
  I need to be able to search for a word

//  Scenario: Searching for a page that does exist
//    Given I am on "/wiki/Main_Page"
 //   When I fill in "search" with "Behavior Driven Development"
///    And I press "searchButton"
 //   Then I should see "agile software development"

 ///* Scenario: Searching for a page that does NOT exist
    Given I am on "/wiki/Main_Page"
    When I fill in "search" with "Glory Driven Development"
    And I press "searchButton"
    Then I should see "Search results"
*//
@mink:selenium2 @javascript
Scenario: Searching for a page with autocompletion
  Given I am on "/radio"
  Then I can see "iPlayer Radio"
