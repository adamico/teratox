Feature: Search dossiers
  So that I can do stuff to specific dossiers
  As a teratox user
  I want to search dossiers by different fields

  Scenario Outline: search dossiers by patient name
    Given the following dossiers exist
      | n_sicap   | nom     |
      | LP9999999 | Martin  |
      | LP9999998 | Machin  |
      | LP9999997 | Machine |
      And I am on the dossiers page
    When I fill in "Nom patiente" with "<pattern>"
      And I press "Rechercher"
    Then I should see "<resultat>"
      And I should see "<dossier1>"
      And I should see "<dossier2>"

    Examples:
      |pattern|count|resultat               |dossier1 |dossier2 |
      |mar    |1    |1 dossier              |LP9999999|         |
      |mac    |2    |2 dossiers sont montrés|LP9999998|LP9999997|
      |gap    |0    |Aucun résultat         |         |         |

  Scenario: search dossiers by evolution type
    Given an acctype: "nai" exists with name: "naissance"
      And an acctype: "fcs" exists with name: "fausse couche spontanée"
      And a dossier exists with n_sicap: "LP1", acctype: acctype "nai"
      And another dossier exists with n_sicap: "LP2", acctype: acctype "nai"
      And another dossier exists with n_sicap: "LP3", acctype: acctype "fcs"
    When I am on the dossiers page
      And I select "naissance" from "search[acctype_id_equals]"
      And I press "Rechercher"
    Then I should see "2 dossiers sont montrés"
      And I should see "LP1"
      And I should see "LP2"

  Scenario: search dossiers by exposition
    Given a produit: "solvants" exists with name: "SOLVANT(S)"
      And a dossier exists with n_sicap: "LP1"
      And another dossier exists with n_sicap: "LP2"
      And an exposition exists with dossier: the first dossier, produit: the produit
      And another exposition exists with dossier: the 2nd dossier, produit: the produit
    When I am on the dossiers page
      And I select "SOLVANT(S)" from "search[produits_id_equals]"
      And I press "Rechercher"
    Then I should see "2 dossiers sont montrés"
      And I should see "LP1"
      And I should see "LP2"

  Scenario: search dossiers by profession
    Given a profession: "techlabo" exists with name: "Technicienne de laboratoire"
      And a dossier exists with n_sicap: "LP1", profession: profession "techlabo"
    When I am on the dossiers page
      And I select "Technicienne de laboratoire" from "search[profession_id_equals]"
      And I press "Rechercher"
    Then I should see "1 dossier"
      And I should see "LP1"
