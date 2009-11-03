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

  Scenario: expositions
    Given a produit: "SOLVANT(S)" exists
      And another produit: "PLOMB" exists
      And a dossier exists with n_sicap: "LP1"
      And another dossier exists with n_sicap: "LP2"
      And an exposition exists with dossier: the first dossier, produit: the first produit
      And an exposition exists with dossier: the 2nd dossier, produit: the 2nd produit
    Then the first dossier should be one of produit: "SOLVANT(S)"'s dossiers
      And the 2nd dossier should be one of produit: "PLOMB"'s dossiers
