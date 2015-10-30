Given /the following recipes exist/ do |recipe_table|
    recipe_table.hashes.each do |recipe|
        Recipe.create!(recipe)
    end
end
