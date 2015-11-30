Feature: add a new recipe
 
  As an anonymous cooking guru
  So that I share my cooking knowledge 
  I want bestow my infinite knowledge upon the database

Scenario: add a new recipe containing pork and rice
  
  Given I am on the recipe-finder home page
  When I press "Add Recipe" 
  Then I should be on the add new recipe page
  When I fill in "title" with "Pork Fried Rice"
  And I fill in "cook_time" with "30"
  And I fill in "directions" with "Make your apprentice do it"
  And I fill in "main_ingredient" with "Pork"
  And I fill in "side_ingredient" with "Rice"
  And I press "Submit"
  Then I should be on the recipe-finder home page
  And I should see "Successfully added Pork Fried Rice"
  
Scenario: add a new recipe containing pork and rice and an image
  
  Given I am on the recipe-finder home page
  When I press "Add Recipe" 
  Then I should be on the add new recipe page
  When I fill in "title" with "Pork Fried Rice"
  And I fill in "cook_time" with "30"
  And I fill in "directions" with "Make your apprentice do it"
  And I fill in "main_ingredient" with "Pork"
  And I fill in "side_ingredient" with "Rice"
  And I provide an image file for "recipe_image"
  And I press "Submit"
  Then I should be on the recipe-finder home page
  And I should see "Successfully added Pork Fried Rice"

Scenario: add a new recipe missing a title
  
  Given I am on the recipe-finder home page
  When I press "Add Recipe" 
  Then I should be on the add new recipe page
  When I fill in "cook_time" with "30"
  And I fill in "directions" with "Make your apprentice do it"
  And I fill in "main_ingredient" with "Pork"
  And I fill in "side_ingredient" with "Rice"
  And I press "Submit"
  Then I should be on the recipe-finder home page
  And I should see "YOU MUST SPECIFY ALL RECIPE CRITERIA"
  
Scenario: add a new recipe missing a cook time
  
  Given I am on the recipe-finder home page
  When I press "Add Recipe" 
  Then I should be on the add new recipe page
  When I fill in "title" with "Pork Fried Rice"
  And I fill in "directions" with "Make your apprentice do it"
  And I fill in "main_ingredient" with "Pork"
  And I fill in "side_ingredient" with "Rice"
  And I press "Submit"
  Then I should be on the recipe-finder home page
  And I should see "YOU MUST SPECIFY ALL RECIPE CRITERIA"
  
Scenario: add a new recipe missing a main_ingredient
  
  Given I am on the recipe-finder home page
  When I press "Add Recipe" 
  Then I should be on the add new recipe page
  When I fill in "title" with "Pork Fried Rice"
  And I fill in "cook_time" with "30"
  And I fill in "directions" with "Make your apprentice do it"
  And I fill in "side_ingredient" with "Rice"
  And I press "Submit"
  Then I should be on the recipe-finder home page
  And I should see "YOU MUST SPECIFY ALL RECIPE CRITERIA"
  
Scenario: add a new recipe missing a main_ingredient
  
  Given I am on the recipe-finder home page
  When I press "Add Recipe" 
  Then I should be on the add new recipe page
  When I fill in "title" with "Pork Fried Rice"
  And I fill in "cook_time" with "30"
  And I fill in "directions" with "Make your apprentice do it"
  And I fill in "main_ingredient" with "Pork"
  And I press "Submit"
  Then I should be on the recipe-finder home page
  And I should see "YOU MUST SPECIFY ALL RECIPE CRITERIA"

Scenario: add a new recipe missing multiple criteria
  
  Given I am on the recipe-finder home page
  When I press "Add Recipe" 
  Then I should be on the add new recipe page
  When I fill in "title" with "Pork Fried Rice"
  And I fill in "cook_time" with "30"
  And I fill in "main_ingredient" with "Pork"
  And I press "Submit"
  Then I should be on the recipe-finder home page
  And I should see "YOU MUST SPECIFY ALL RECIPE CRITERIA"