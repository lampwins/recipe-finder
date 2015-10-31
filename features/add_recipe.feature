Feature: add a new recipe
 
  As an anonymous cooking guru
  So that I share my cooking knowledge 
  I want bestow my infinite knowledge upon the database

Scenario: search for recipes containing chicken
  
  Given I am on the recipe-finder home page
  When I follow "Add Recipe" 
  Then I should be on the add new recipe page
  When I fill in "title" with "Chicken and Rice"
  And I fill in "cook_time" with "2"
  And I fill in "directions" with "Make your apprentice do it"
  And I fill in "main_ingredient" with "Chicken"
  And I fill in "side_ingredient" with "Rice"
  And I press "Submit"
  Then I should be on the recipe-finder home page
  And I should see "Successfully added Chicken and Rice"
  
  