Feature: Manage Produits

  So that I can manage produits in the database
  As myself
  I want to browse for produits

  Scenario: browse for produits
    Given I have a produit named tartampionate de sodium
    When I am on the list of produits
    Then I should see "tartampionate de sodium"
