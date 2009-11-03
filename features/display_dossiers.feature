Feature: Manage dossiers

  So that I can operate on the right dossier
  As a teratox user
  I want to browse dossiers and see detailed information

  Scenario: creating and asserting
    Given a dossier exists with nom: "Martin", n_sicap: "LP1"
      And another dossier exists with nom: "Machin", n_sicap: "LP2"
      And another dossier exists with nom: "Machine", n_sicap: "LP3"
    Then a dossier should exist with nom: "Machin"
      And 3 dossiers should exist

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
