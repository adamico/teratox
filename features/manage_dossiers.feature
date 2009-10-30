Feature: Manage dossiers

  So that I can find evidence on teratogen products
  As a teratox user
  I want to manage dossiers

  Background:
    Given the following dossier records
    | n_sicap   | nom     |
    | LP9999999 | Martin  |
    | LP9999998 | Machin  |
    | LP9999997 | Machine |
      And I am on the list of dossiers

  Scenario: show a dossier from the list
    When I follow "LP9999999"
    Then I should see "LP9999999"
      And I should see "Patiente :"
      And I should see "MARTIN"

@focus
  Scenario Outline: search dossiers by patient name
    When I fill in "search[nom_like]" with "<pattern>"
      And I press "Rechercher"
    Then I should see "Liste des dossiers (<count>)"
      And I should see "<dossier1>"
      And I should see "<dossier2>"

    Examples:
      | pattern | count | dossier1  | dossier2  |
      | mar     | 1     | LP9999999 |           |
      | mac     | 2     | LP9999998 | LP9999997 |
      | gap     | 0     |           |           |
