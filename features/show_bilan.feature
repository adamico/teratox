Feature: show statistics
  In order to have a photograph of the teratox db
  As a user
  I want to read statistics info in the bilan page

  Scenario: show parité (nombre de grossesses portées à terme)
    Given the following dossiers exist
      | age | nai |
      | 26  | 1   |
      | 27  | 0   |
      | 22  | 3   |
      | 30  | 1   |
    When I go to the bilan page
    Then I should see the don_gen table
      |     | Groupe Solvants | Groupe Produits divers | Total n = 4 |
      | Âge | 
    
