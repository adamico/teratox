Feature: manage dossiers
  In order to have dossiers on my website
  As an admin
  I want to manage dossiers

  Background:
    Given I am a new authenticated admin
    And an acctype exist with abbr: "at1" 

  @dossiers-list @list
  Scenario: Dossiers List
    Given the following dossiers exist:
      | n_sicap | nom | date_appel | acctype	| expo_type |
      | LP1	| nom | 25/11/2010 | the acctype| solvants  |
      | LP2	| nom | 25/11/2010 | the acctype| solvants  |

    When I go to the dossiers page
    Then I should see "LP1"
    And I should see "LP2"

  @dossiers-valid @valid
  Scenario: create a valid dossier
    When I go to the new dossier page
      And I fill in "N° SICAP" with "LP01"
      And I fill in "Nom" with "martin"
      And I select "at1" from "Type Accouchement"
      And I select "solvants" from "Type Expo"
      And I fill in "Date appel" with "25/11/2010"
      And I press the "Create Dossier" button
    Then 1 dossiers should exist
    And I should see a "create" flash message for "Dossier"
    And I should see "LP01"

  @dossiers-invalid @invalid
  Scenario: create invalid dossier
    When I go to the new dossier page
      And I press the "Create Dossier" button
    Then I should see "N sicap doit être rempli(e)"
      And 0 dossiers should exist

  @dossiers-edit @edit
  Scenario: edit existing dossier
    Given a dossier exist with nom: "martin"
    When I go to the dossier page
      And I follow "Modifier"
      And I fill in "Nom" with "autre chose"
      And I press the "Update Dossier" button
    Then I should see a "update" flash message for "Dossier"
      And I should see "AUTRE CHOSE"
      And I should be on the dossier page
      And I should not see "martin"

  @dossiers-delete @delete @javascript @wip
  Scenario: delete dossier
    Given a dossier exist
    When I go to the dossier page
      And I follow "Détruire"
    Then I should see a "destroy" flash message for "Dossier"
      And 0 dossiers should exist
