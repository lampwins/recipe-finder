Feature: search for recipes by protien and side
 
  As a confounded cook
  So that I can quickly impress my boss with my culinary knowhow
  I want to see recipes containing my chosen ingredient

Background: recipes have been added to database

  Given the following recipes exist:
  | title                   | cook_time | directions | main_ingredient | side_ingredient |
  | Chicken and Rice        | 2         | "Cook good"| Chicken         | Rice            |
  | Roast Beef and Potatoes | 2         | "Cook good"| Beef            | Potatoes        |

  And  I am on the recipe-finder home page

Scenario: search for recipes containing chicken
  
  When I select "Chicken" from "main_ingredient"
  And I select "Rice" from "side_ingredient"
  And I press "Submit"
  Then I should be on the recipe page
  And I should see "Chicken"
  And I should see "Rice"
  
Scenario: search for recipes containing no ingredients
  
  When I press "Submit"
  Then I should be on the recipe-finder home page
  And I should see "YOU MUST SPECIFY BOTH INGREDIENTS"
  
Scenario: search for recipes containing only a main ingredient
  
  When I select "Chicken" from "main_ingredient"
  And I press "Submit"
  Then I should be on the recipe-finder home page
  And I should see "YOU MUST SPECIFY BOTH INGREDIENTS"

Scenario: search for recipes containing only a side ingredient
  
  When I select "Rice" from "side_ingredient"
  And I press "Submit"
  Then I should be on the recipe-finder home page
  And I should see "YOU MUST SPECIFY BOTH INGREDIENTS"

Scenario: search for ingredients that are not found in a recipe
  When I select "Chicken" from "main_ingredient"
  When I select "Potatoes" from "side_ingredient"
  And I press "Submit"
  Then I should be on the recipe-finder home page
  And I should see "There is no recipe with these ingredients"