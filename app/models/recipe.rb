class Recipe < ActiveRecord::Base
    
    def self.allMainIngredients
        Recipe.uniq.pluck(:main_ingredient)
    end
    
    def self.allSideIngredients
        Recipe.uniq.pluck(:side_ingredient)
    end
end
