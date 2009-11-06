Feature: Modify dossiers

  So that I can operate on the right dossier
  As a teratox user
  I want to browse dossiers and see detailed information

@focus
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
