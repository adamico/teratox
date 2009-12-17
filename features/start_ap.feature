Feature: assignment pairing app
  As an epidemiologist wannabe
  I want to be able to match patients from a csv to patients to another csv

  Scenario: count rows with valid fields
    Then I should have 10 controls
      And I should have 10 cases
    
