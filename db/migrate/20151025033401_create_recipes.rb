class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :title
      t.integer :cook_time
      t.string :directions
      t.timestamps null: false
    end
    create_table :ingredients do |t|
      t.string :common_name
      t.string :name
      t.integer :recipe
    end
    add_foreign_key :ingredients, :recipes,  column: :recipe
  end
end
