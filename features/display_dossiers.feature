Feature: Display dossiers

  So that I can operate on the right dossier
  As a teratox user
  I want to browse dossiers and see detailed information

  Scenario: show dossier
    Given a dossier exists with nom: "Martin", n_sicap: "LP1"
    When I go to the dossier's page
    Then I should see "LP1"
    And I should see "MARTIN"

@focus
  Scenario: list dossiers
    Given the following dossiers exist
      | n_sicap   | nom     | prenom  |
      | LP9999999 | Martin  | Marie   |
      | LP9999998 | Machin  | Laure   |
      | LP9999997 | Machine | Laurie  |
    When I go to the dossiers page
    Then I should see dossiers table
      | LP9999999 | MARTIN M. |
      | LP9999998 | MACHIN L. |
      | LP9999997 | MACHINE L. |
