class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      
      t.string :title
      t.integer :cook_time
      t.text :directions
      t.string :main_ingredient
      t.string :side_ingredient

      t.timestamps null: false
    end
  end
end
