# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Recipe.create(title: 'Chicken and Rice', cook_time: 2, directions: 'Cook stuff like smart', main_ingredient: 'Chicken', side_ingredient: 'Rice', created_at: 2015, updated_at: 2015)
Recipe.create(title: 'London Broil with Roasted Potatoes', cook_time: 60, directions: 'Cook stuff like smart', main_ingredient: 'London Broil', side_ingredient: 'Red Potatoe', created_at: 2015, updated_at: 2015)
