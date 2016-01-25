Feature: regis api can connect
  In order to use the REGIS api
  I want to be able to connect

Scenario: search sections
    When I search for sections
    Then I should receive a list of sections

Scenario: retrieve section
    When I ask for a section
    Then I should receive the section I asked for
    
Scenario: section values are populated
    When I ask for a section
    Then I should have populated section values
    Then I should have an instructor
    
Scenario: api is cached
    When I reset the section cache
    And I ask for a section
    Then I should receive the section I asked for
    When I ask for a section
    Then I should have a cached response
    
Scenario: section has formatted start and end dates
    When I ask for a section
    Then I should have formatted start and end dates