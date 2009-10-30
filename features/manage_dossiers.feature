Feature: Manage dossiers

  So that I can find evidence on teratogen products
  As a teratox user
  I want to manage dossiers

  Background:
    Given I have a dossier numbered LP9999999
      And the patient name is Martin
      And I am on the list of dossiers

  Scenario: show a dossier from the list
    When I follow "LP9999999"
    Then I should see "LP9999999"
      And I should see "Patiente :"
      And I should see "MARTIN"

  Scenario: search dossiers by patient name with 1 positive result
    When I fill in "search[nom_like]" with "mar"
      And I press "Rechercher"
    Then I should see "Liste des dossiers (1)"
      And I should see "LP9999999"

