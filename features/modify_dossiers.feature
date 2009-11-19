Feature: Modify dossiers

  So that I can operate on the right dossier
  As a teratox user
  I want to browse dossiers and see detailed information

  Scenario: expositions
    Given a produit: "SOLVANT(S)" exists
      And another produit: "PLOMB" exists
      And a dossier exists with n_sicap: "LP1"
      And another dossier exists with n_sicap: "LP2"
      And an exposition exists with dossier: the first dossier, produit: the first produit
      And an exposition exists with dossier: the 2nd dossier, produit: the 2nd produit
    Then the first dossier should be one of produit: "SOLVANT(S)"'s dossiers
      And the 2nd dossier should be one of produit: "PLOMB"'s dossiers

  Scenario: links in dossier page
    Given a dossier exists with nom: "Martin", n_sicap: "LP1"
    When I go to the dossier's page
    Then I should see "Modifier"
      And I should see "Saisir un nouveau dossier"
      And I should see "Retour à l'accueil"

  Scenario: add an existing correspondant to dossier
    Given a correspondant exists
      And a dossier exists
    When I go to the dossier's edit page
      And I select "Toubib" from "dossier[correspondant_id]"
      And I press "Save dossier"
    Then I should see "Correspondant :"
      And I should see "Toubib"

  Scenario: show a link to new correspondant
    Given a dossier exists
    When I go to the dossier's edit page
      And I follow "Saisir un nouveau correspondant"
    Then I should be on the new correspondant page

  @focus
  Scenario: add demandeur to dossier
    Given a dossier exists
    When I go to the dossier's edit page
      And I select "patiente" from "dossier[demandeur_id]"
      And I press "Save dossier"
    Then I should see "Demandeur :"
      And I should see "patiente"

