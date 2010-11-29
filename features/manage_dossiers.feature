Feature: manage dossiers
  In order to fill a db with chemicals exposure during pregnancy
  As a db filler
  I want to manage dossiers

  Background:
    Given I am a new authenticated admin

  Scenario: create a valid dossier
    Given an acctype exist with abbr: "at1" 
    When I go to the new dossier page
      And I fill in "N° SICAP" with "LP01"
      And I fill in "Nom" with "martin"
      And I select "at1" from "Type Accouchement"
      And I select "solvants" from "Type Expo"
      And I fill in "Date appel" with "25/11/2010"
      And I press "Create Dossier"
    Then I should see a "dossiers.create" message
