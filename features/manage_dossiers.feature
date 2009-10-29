Feature: Browse dossiers in database

  So that I can modify dossiers in the database
  As a teratox user
  I want to list dossiers and access singularly

  Background:
    Given I have a dossier numbered LP9999999

  Scenario: list all dossiers
    When I am on the list of dossiers
    Then I should see "LP9999999"

  Scenario: show a dossier from the list
    Given I am on the list of dossiers
    When I follow "LP9999999"
    Then I should see "LP9999999"
