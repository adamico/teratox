Feature: authentication
  In order to protect unauthorized modifications to the db
  I want users to authenticate

  Scenario: log in successfully
    Given I am not authenticated
      And a user exists with login: "user", password: "secretpass"
    When I go to the login page
      And I fill in "user_login" with "user"
      And I fill in "user_password" with "secretpass"
      And I press "Sign in"
    Then I should see "Welcome"

  Scenario: log out
    Given I am a new authenticated user
    When I logout
    Then I should see a "devise.sessions.signed_out" message
