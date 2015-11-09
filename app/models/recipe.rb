class Recipe < ActiveRecord::Base
    
    def self.allMainIngredients
        Recipe.uniq.pluck(:main_ingredient)
    end
    
    def self.allSideIngredients
        Recipe.uniq.pluck(:side_ingredient)
    end
    
    def self.nextRecipe(main_ingredient, side_ingredient, recipes_to_exclude)
        Recipe.find_by_sql(["SELECT * FROM recipes WHERE recipes.main_ingredient = ? AND recipes.side_ingredient = ? LIMIT 1", main_ingredient, side_ingredient])
        # recipes.title NOT IN ? AND recipes_to_exclude, 
    end
end
