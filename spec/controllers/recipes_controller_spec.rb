require 'rails_helper'

RSpec.describe RecipesController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "#show" do
    before(:each) do
      @recipe = Recipe.create! :main_ingredient => "Chicken", :side_ingredient => "Rice", :directions => "cook it", :cook_time => 30, :title => "Test", :id => 1
      @recipe = Recipe.create! :main_ingredient => "Chicken", :side_ingredient => "Rice", :directions => "cook it", :cook_time => 15, :title => "Test2", :id => 2
    end
    it 'accepts params' do
      get :show, :main_ingredient => 'Chicken', :side_ingredient => 'Rice'
      expect(response).to have_http_status(:success)
    end
    it "works for clicking choose another" do
      get :show, :main_ingredient => 'Chicken', :side_ingredient => 'Rice', :ids => "1"
      expect(response).to have_http_status(:success)
    end
    it "sends back to home page if no more exist" do
      get :show, :main_ingredient => 'Chicken', :side_ingredient => 'Rice', :ids => "1,2"
      expect(controller.flash[:notice]).to eq("There are no more recipes for these ingredients")
    end
    it "sends back to home if nothing matches" do
      get :show, :main_ingredient => 'Pork', :side_ingredient => 'Rice'
      expect(controller.flash[:notice]).to eq("There is no recipe with these ingredients")
    end
    it "sends back if invalid input" do
      get :show, :main_ingredient => 'select', :side_ingredient => 'select'
      expect(controller.flash[:notice]).to eq("YOU MUST SPECIFY BOTH INGREDIENTS")
    end
  end

end
