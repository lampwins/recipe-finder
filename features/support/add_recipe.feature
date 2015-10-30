Feature: add a new recipe
 
  As an anonymous cooking guru
  So that I share my cooking knowledge 
  I want bestow my infinite knowledge upon the database

Scenario: search for recipes containing chicken
  
  Given I am on the recipe-finder home page
  When I press "add" 
  Then I should be on the add new recipe page
  When I enter "Chicken and Rice" into "Recipe Name"
  And I enter 2 into "Cook Time"
  And I enter "Tastes duck" into "Description"
  And I enter "Chicken" into "Protein"
  And I enter "Rice" into "Side"
  And I enter "Make your apprentice do it" into "Instructions"
  And I press "submit"
  Then I should be on the recipe-finder home page
  And I should see "Thank You for your submission!"
  
  