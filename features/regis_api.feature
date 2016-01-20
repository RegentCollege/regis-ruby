Feature: regis api can connect
  In order to use the REGIS api
  I want to be able to connect

Scenario: search sections
    When I search for sections
    Then I should receive a list of sections
    
Scenario: retrieve section
    When I ask for a section
    Then I should receive the section I asked for