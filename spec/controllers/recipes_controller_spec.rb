require 'rails_helper'

RSpec.describe RecipesController, type: :controller do

  describe "#show" do
    before(:each) do
      Recipe.delete_all
      @recipe = Recipe.create! :main_ingredient => "Chicken", :side_ingredient => "Rice", :directions => "cook it", :cook_time => 30, :title => "Test", :id => 1
      @recipe = Recipe.create! :main_ingredient => "Chicken", :side_ingredient => "Rice", :directions => "cook it", :cook_time => 15, :title => "Test2", :id => 2
    end
    it 'accepts params' do
      get :show, :main_ingredient => 'Chicken', :side_ingredient => 'Rice'
      @recipe.title = "Test2" 
      @recipe.id = 2
      expect(response).to have_http_status(:success)
    end
    it "works for clicking choose another" do
      get :show, :main_ingredient => 'Chicken', :side_ingredient => 'Rice', :ids => "1"
      @recipe.title = "Test"
      @recipe.id = 1
      expect(response).to have_http_status(:success)
    end
    it "sends back to home page if no more exist" do
      get :show, :main_ingredient => 'Chicken', :side_ingredient => 'Rice', :ids => "1,2"
      @recipe.present? == false
      expect(controller.flash[:notice]).to eq("There are no more recipes for these ingredients")
    end
    it "sends back to home if nothing matches" do
      get :show, :main_ingredient => 'Pork', :side_ingredient => 'Rice'
      @recipe.present? == false
      expect(controller.flash[:notice]).to eq("There is no recipe with these ingredients")
    end
    it "sends back if invalid input" do
      get :show, :main_ingredient => 'select', :side_ingredient => 'select'
      expect(controller.flash[:notice]).to eq("YOU MUST SPECIFY BOTH INGREDIENTS")
    end
  end
  
  describe "#create" do
    it "creates recipe without image" do 
      @recipe = Recipe.new(title: "title", cook_time: "2", main_ingredient: "test main", side_ingredient: "test side")
      @recipe.save!
      expect Recipe.last.cook_time == 2 
    end
    it "creates recipe with image" do 
      @recipe = Recipe.new(title: "title", cook_time: "3", main_ingredient: "test main", side_ingredient: "test side", recipe_image: File.open(Rails.root.join("app", "images", "Chicken_BrownRice.jpg")))
      @recipe.save!
      expect Recipe.last.cook_time == 3
    end

    it "sends back if invalid input" do
      post :create, :title => '', :cook_time => '', :main_ingredient => '', :side_ingredient => '' 
      expect(controller.flash[:notice]).to eq("YOU MUST SPECIFY ALL RECIPE CRITERIA")
    end
    # it "works without adding a picture" do
    #   post :create, :title => 'test', :cook_time => '5', :main_ingredient => 'test', :side_ingredient => 'Rice' 
    #   expect(controller.flash[:notice]).to eq("Successfully added test")
    # end
  end
end
