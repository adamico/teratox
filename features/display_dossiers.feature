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
      | n_sicap   | nom     | prenom  |
      | LP9999999 | Martin  | Marie   |
      | LP9999998 | Machin  | Laure   |
      | LP9999997 | Machine | Laurie  |
    When I go to the dossiers page
    Then I should see dossiers table
      | LP9999999 | MARTIN M. |
      | LP9999998 | MACHIN L. |
      | LP9999997 | MACHINE L. |

  Scenario: show correspondant fields in dossier
    Given a correspondant: "toubib" exists with nom: "Toubib", adresse: "99, rue des Foldingues", ville: "Paranoia", cp: "99999"
      And another correspondant: "partic" exists with nom: "Particulier", adresse: "1, rue des Lilas", ville: "Lyon", cp: "11111"
      And a dossier exists with n_sicap: "LP1", nom: "Martin", correspondant: correspondant: "toubib"
      And another dossier exists with n_sicap: "LP2", nom: "Machin", correspondant: correspondant: "partic"
    When I go to the first dossier's page
    Then I should see "LP1"
      And I should see "Correspondant :"
      And I should see "Toubib"
      And I should see "99, rue des Foldingues"
      And I should see "Paranoia"
      And I should see "99999"

  Scenario: show dossier global commentaire
    Given a dossier exists with commentaire: "Ceci est un commentaire"
    When I go to the dossier's page
    Then I should see "Commentaire"
      And I should see "Ceci est un commentaire"

@focus
  Scenario Outline: prints gestite in dossier show
    Given the following dossiers exist
      | fcs | geu | img | ivg | miu | nai |
      | 0   | 0   | 0   | 0   | 0   | 0   |
      | 2   | 0   | 0   | 0   | 0   | 1   |
      | 0   | 0   | 0   | 0   | 0   | 2   |
      | 2   | 1   | 1   | 1   | 1   | 0   |
      | 1   | 1   | 1   | 1   | 1   | 1   |
    When I go to the <position> dossier's page
    Then I should see "Gestité : <gestite>"

    Examples:
      | position  | gestite                                     |
      | first     | G1                                          |
      | 2nd       | G4 (dont 2 fcs)                             |
      | 3rd       | G3                                          |
      | 4th       | G7 (dont 2 fcs 1 geu 1 miu 1 ivg 1 img) |
      | 5th       | G7 (dont 1 fcs 1 geu 1 miu 1 ivg 1 img) |
