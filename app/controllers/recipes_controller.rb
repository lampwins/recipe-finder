class RecipesController < ApplicationController
  
  def index
    @main_ingredients = Recipe.allMainIngredients
    @side_ingredients = Recipe.allSideIngredients
    
  end
  
  def create
    if params[:title] == "" || params[:cook_time] == "" || params[:directions] == "" || params[:main_ingredient] == "" || params[:side_ingredient] == ""
      flash[:notice] = "YOU MUST SPECIFY ALL RECIPE CRITERIA"
      redirect_to :root
    else
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
  end
  
  def new
    
  end
  
  def show
    if params[:main_ingredient] == "select" || params[:side_ingredient] == "select"
      flash[:notice] = "YOU MUST SPECIFY BOTH INGREDIENTS"
      redirect_to(:root)
      return
    end
    
    @recipes_to_exclude = []
    
    if flash[:recipes_to_exclude] == nil
      @recipe = Recipe.find_by main_ingredient: params[:main_ingredient], side_ingredient: params[:side_ingredient]
    else
      @recipes_to_exclude = flash[:recipes_to_exclude]
      foundRecipe = false
      checkRecipe = Recipe.new()
      checkRecipe = Recipe.find_by main_ingredient: params[:main_ingredient], side_ingredient: params[:side_ingredient]
      @recipes_to_exclude.each do |r|
        if r == checkRecipe.title
          foundRecipe = true
        end
      end
      if foundRecipe
        @recipe = Recipe.nextRecipe(params[:main_ingredient], params[:side_ingredient], :recipes_to_exclude => @recipes_to_exclude.join(','))
      else
        @recipe = Recipe.find_by main_ingredient: params[:main_ingredient], side_ingredient: params[:side_ingredient]
      end
    end
    if @recipe.nil?
      flash[:notice] = "There is no recipe with these ingredients"
      redirect_to(:root)
      return
    elsif @recipe.title.nil?
      flash[:notice] = "There are no more recipes with these ingredients"
      redirect_to(:root)
      return
    else
      @recipes_to_exclude.push(@recipe.title)
      flash[:recipes_to_exclude] = @recipes_to_exclude
    end
  end
end
