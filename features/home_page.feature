Feature: user access the home page

  As a user
  I want to choose an action from the home page
  So that I can do what I need with teratox

  Background:
    Given I am on the homepage
      And I have a dossier numbered "LP9999999"

  Scenario: Link to new dossier
    When I follow "Un nouveau dossier"
    Then I should see "Creation d'un nouveau dossier"

  Scenario: Link to dossier list
    When I follow "Tous les dossiers"
    Then I should see "Liste des dossiers"

@search
  Scenario: Search for a dossier by n_sicap
    When I fill in "search[n_sicap_like]" with "LP9999999"
      And I press "Rechercher"
    Then I should see "Liste des dossiers (1)"
      And I should see "LP9999999"

  Scenario: Link to bilan/statistiques
    When I follow "Bilan/statistiques"
    Then I should be on bilan page

@focus
  Scenario: Link to evolution
    When I follow "Une évolution"
    Then I should be on dossiers page
