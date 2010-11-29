Feature: authentication
  In order to protect unauthorized modifications to the db
  I want users to authenticate

  Scenario: log in successfully
    Given I am not authenticated
      And I am a new authenticated user
    Then I should see "Welcome"
