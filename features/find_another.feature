Feature: Find another recipe 
  As a customer
  So that I can have an additional option(s) for a recipe
  I want to see an additional recipe if I click no to the current one

Background: recipes have been added to database

  Given the following recipes exist:
  | title                       | cook_time  | directions | main_ingredient | side_ingredient |
  | Chicken and Rice            | 30         | Cook good  | Chicken         | Rice            |
  | Herb Chicken with Wild Rice | 45         | Cook good  | Chicken         | Rice            |

  And  I am on the recipe-finder home page

Scenario: search for recipes containing chicken
  
  When I select "Chicken" from "main_ingredient"
  And I select "Rice" from "side_ingredient"
  And I press "Submit"
  Then I should be on the recipe page
  And I should see "Chicken and Rice"
  And I should see "Like this recipe?"
  When I press "No Find Another" 
  Then I should be on the recipe page
  And I should see "Herb Chicken with Wild Rice"