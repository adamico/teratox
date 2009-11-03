Feature: Search dossiers

  So that I can do stuff to specific dossiers
  As a teratox user
  I want to search dossiers by different fields

  Background:
    Given the following dossiers exist
    | n_sicap   | nom     |
    | LP9999999 | Martin  |
    | LP9999998 | Machin  |
    | LP9999997 | Machine |
    And I am on the dossiers page

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

@focus
    Scenario: search dossiers by evolution type

    Scenario: search dossiers by exposition
