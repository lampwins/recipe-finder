Feature: add a new recipe
 
  As an authority-imbued key-holding power-weilding administrator
  So that I may maintain order 
  I want to delete bad recipes from the database

Background: recipes have been added to database

  Given the following recipes exist:
  | title                   | cook_time | directions | main_ingredient | side_ingredient |
  | Chicken and Rice        | 2         | "Cook good"| Chicken         | Rice            |
  | Roast Beef and Potatoes | 2         | "Cook good"| Beef            | Potatoes        |

  And  I am on the recipe-finder home page
  When I press "Administrator Login" 
  Then I should be on the administrator login page
  When I fill in "username" with "MyUserName"
  And I fill in "password" with "password"
  And I press "Login"
  Then I should be on the administrator page

Scenario: delete recipe containing chicken and rice

  When I follow "Chicken and Rice"
  Then I should see "Chicken and Rice has been deleted"
  When I press "Exit" 
  Then I should be on the recipe-finder home page
  When I select "Chicken" from "main_ingredient"
  And I select "Rice" from "side_ingredient"
  And I press "Submit"
  Then I should be on the recipe page