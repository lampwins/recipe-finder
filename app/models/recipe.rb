class Recipe < ActiveRecord::Base
    
    has_attached_file :recipe_image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "missing.png"
    validates_attachment_content_type :recipe_image, content_type: /\Aimage\/.*\Z/
    def self.allMainIngredients
        Recipe.uniq.pluck(:main_ingredient)
    end
    
    def self.allSideIngredients
        Recipe.uniq.pluck(:side_ingredient)
    end
end

