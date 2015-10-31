Feature: search for recipes by protien and side
 
  As a confounded cook
  So that I can quickly impress my boss with my culinary knowhow
  I want to see recipes containing my chosen ingredient

Background: recipes have been added to database

  Given the following recipes exist:
  | title                   | cook_time | directions | main_ingredient | side_ingredient |
  | Chicken and Rice        | 2         | "Cook good"| Chicken         | Rice            |
  

  And  I am on the recipe-finder home page

Scenario: search for recipes containing chicken
  
  When I enter "Chicken" into "protein"
  When I enter "Rice" into "side"
  And I press "Submit"
  Then I should be on the recipe page
  And I should see "Chicken"
  And I should see "Rice"
  
  
  
  