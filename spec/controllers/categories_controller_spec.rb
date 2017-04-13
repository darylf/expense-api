require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
  let(:valid_attributes) { FactoryGirl.attributes_for(:category) }

  let(:invalid_attributes) { FactoryGirl.attributes_for(:category, name: '') }

  let(:valid_session) { {} }

  describe 'GET #index' do
    it 'assigns all categories as @categories' do
      category = Category.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(assigns(:categories)).to eq([category])
    end
  end

  describe 'GET #show' do
    it 'assigns the requested category as @category' do
      category = Category.create! valid_attributes
      get :show, params: { id: category.to_param }, session: valid_session
      expect(assigns(:category)).to eq(category)
    end
  end
end
