class RecipesController < ApplicationController
  
  def index
    @main_ingredients = Recipe.allMainIngredients
    @side_ingredients = Recipe.allSideIngredients
    
  end
  
  def create
    recipe = Recipe.new()
    recipe.title = params[:title]
    recipe.cook_time = params[:cook_time]
    recipe.directions = params[:directions]
    recipe.main_ingredient = params[:main_ingredient]
    recipe.side_ingredient = params[:side_ingredient]
    recipe.save!
  
    flash[:notice] = "Successfully added " + recipe.title
    redirect_to :root
    
  end
  
  def new
    @main_ingredients = Recipe.allMainIngredients
    @side_ingredients = Recipe.allSideIngredients
    
  end
  
  def show
    @recipe = Recipe.find_by main_ingredient: params[:main_ingredient], side_ingredient: params[:side_ingredient]
    
  end
end
