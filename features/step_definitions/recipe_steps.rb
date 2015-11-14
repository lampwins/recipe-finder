Given /the following recipes exist/ do |recipe_table|
    recipe_table.hashes.each do |recipe|
        Recipe.create!(recipe)
    end
end

When /I search for "(.*)" and "(.*)"/ do |i1, i2|
    step "I select \"#{i1}\" from \"main_ingredient\""
    step "I select \"#{i2}\" from \"side_ingredient\""
    step "I press \"Submit\""
end

Then /I should see the "(.*)" recipe/ do |r1|
    step "I should be on the recipe page"
    step "I should see \"#{r1}\""
end