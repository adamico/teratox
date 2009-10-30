Feature: Manage evolutions
  
  In order to complete dossier
  As a user
  I want to list incomplete dossier and complete them

Scenario: Evoluer lists incomplete dossiers
    Given I have a dossier numbered LP9999999
    When I follow "Une évolution"
    Then I should have 1 incomplete dossier
    Then I should be on evoluer page
      And I should see "Dossier à évoluer (1)"

  Scenario: Evoluer redirects to home when all dossiers are complete
    Given All dossiers are complete
    When I follow "Une évolution"
    Then I should see "Toutes les évolutions ont été faites."
      And I should be on the homepage
