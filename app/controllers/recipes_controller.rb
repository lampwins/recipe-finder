class RecipesController < ApplicationController
  
  def index
  end
  
  def create
    recipe = Recipe.new()
    recipe.title = params[:title]
    recipe.cook_time = params[:cook_time]
    recipe.directions = params[:directions]
    recipe.main_ingredient = params[:protein]
    recipe.side_ingredient = params[:side_ingredient]
    recipe.save!
  
    flash[:notice] = "Successfuly added " + recipe.title
    redirect_to :root
    
  end
end
