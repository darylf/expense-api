require 'rails_helper'

RSpec.describe API::V1::ExpensesController, type: :controller do
  let(:category) { FactoryGirl.create(:category) }
  let(:vendor) { FactoryGirl.create(:vendor) }

  let(:valid_attributes) { FactoryGirl.attributes_for(:expense, category_id: category.id, vendor_id: vendor.id) }

  let(:invalid_attributes) { FactoryGirl.attributes_for(:expense, expense_date: '') }

  let(:valid_session) { {} }

  describe 'GET #index' do
    it 'assigns all expense as @expenses' do
      expense = Expense.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(assigns(:expenses)).to eq([expense])
    end
  end

  describe 'GET #show' do
    it 'assigns the requested expense as @expense' do
      expense = Expense.create! valid_attributes
      get :show, params: { id: expense.to_param }, session: valid_session
      expect(assigns(:expense)).to eq(expense)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Expenser' do
        expect do
          post :create, params: { expense: valid_attributes }, session: valid_session
        end.to change(Expense, :count).by(1)
      end

      it 'returns an instance of the new expense' do
        post :create, params: { expense: valid_attributes }, session: valid_session
        json_response = JSON.parse(response.body)
        expect(json_response['cost']).to eq(valid_attributes[:cost])
      end

      it 'responds with 201:Created' do
        post :create, params: { expense: valid_attributes }, session: valid_session
        expect(response).to have_http_status(:created)
      end
    end

    context 'with invalid params' do
      it "doesn't create a new Expense" do
        expect do
          post :create, params: { expense: invalid_attributes }, session: valid_session
        end.to change(Expense, :count).by(0)
      end

      it 'responds with 422:Unprocessable Entity' do
        post :create, params: { expense: invalid_attributes }, session: valid_session
        expect(response).to have_http_status(422)
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) { { cost: 9.99 } }

      it 'updates the requested expense' do
        expense = Expense.create! valid_attributes
        put :update, params: { id: expense.to_param, expense: new_attributes }, session: valid_session
        expense.reload
        expect(expense.cost).to eq(new_attributes[:cost])
      end

      it 'returns http status 200:OK' do
        expense = Expense.create! valid_attributes
        put :update, params: { id: expense.to_param, expense: new_attributes }, session: valid_session
        expect(response).to have_http_status(:ok)
      end
    end

    context 'with invalid params' do
      it 'updates the requested expense' do
        expense = Expense.create! valid_attributes
        expense_cost = expense.cost
        put :update, params: { id: expense.to_param, expense: { expense_date: '' } }, session: valid_session
        expense.reload
        expect(expense.cost).to eq(expense_cost)
      end

      it 'returns http status 422:Unprocessable Entity' do
        expense = Expense.create! valid_attributes
        put :update, params: { id: expense.to_param, expense: { expense_date: '' } }, session: valid_session
        expect(response).to have_http_status(422)
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested expense' do
      expense = Expense.create! valid_attributes
      expect do
        delete :destroy, params: { id: expense.to_param }, session: valid_session
      end.to change(Expense, :count).by(-1)
    end

    it 'returns http status 204:No Content' do
      expense = Expense.create! valid_attributes
      delete :destroy, params: { id: expense.to_param }, session: valid_session
      expect(response).to have_http_status(204)
    end
  end
end
