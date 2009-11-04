Feature: Display dossiers

  So that I can operate on the right dossier
  As a teratox user
  I want to browse dossiers and see detailed information

  Scenario: show dossier
    Given a dossier exists with nom: "Martin", n_sicap: "LP1"
    When I go to the dossier's page
    Then I should see "LP1"
    And I should see "MARTIN"

  Scenario: list dossiers
    Given the following dossiers exist
      | n_sicap   | nom     |
      | LP9999999 | Martin  |
      | LP9999998 | Machin  |
      | LP9999997 | Machine |
    When I go to the dossiers page
    Then I should see dossiers table
      | LP9999999 | MARTIN  |
      | LP9999998 | MACHIN  |
      | LP9999997 | MACHINE |
