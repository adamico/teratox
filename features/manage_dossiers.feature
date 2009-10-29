Feature: Browse dossiers in database

  So that I can modify dossiers in the database
  As a teratox user
  I want to list and modify dossiers

  Scenario: list all dossiers
    Given I have a dossier numbered LP9999999
    When I am listing the dossiers
    Then I should see "LP9999999"
