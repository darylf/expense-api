require 'rails_helper'

RSpec.describe API::V1::VendorsController, type: :controller do
  let(:valid_attributes) { FactoryGirl.attributes_for(:vendor) }

  let(:invalid_attributes) { FactoryGirl.attributes_for(:vendor, name: '') }

  let(:valid_session) { {} }

  describe 'GET #index' do
    it 'assigns all vendors as @vendors' do
      vendor = Vendor.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(assigns(:vendors)).to eq([vendor])
    end
  end

  describe 'GET #show' do
    it 'assigns the requested vendor as @vendor' do
      vendor = Vendor.create! valid_attributes
      get :show, params: { id: vendor.to_param }, session: valid_session
      expect(assigns(:vendor)).to eq(vendor)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Vendor' do
        expect do
          post :create, params: { vendor: valid_attributes }, session: valid_session
        end.to change(Vendor, :count).by(1)
      end

      it 'returns an instance of the new vendor' do
        post :create, params: { vendor: valid_attributes }, session: valid_session
        json_response = JSON.parse(response.body)
        expect(json_response['name']).to eq(valid_attributes[:name])
      end

      it 'responds with 201:Created' do
        post :create, params: { vendor: valid_attributes }, session: valid_session
        expect(response).to have_http_status(:created)
      end
    end

    context 'with invalid params' do
      it "doesn't create a new Vendor" do
        expect do
          post :create, params: { vendor: invalid_attributes }, session: valid_session
        end.to change(Vendor, :count).by(0)
      end

      it 'responds with 422:Unprocessable Entity' do
        post :create, params: { vendor: invalid_attributes }, session: valid_session
        expect(response).to have_http_status(422)
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) { { name: 'New Name' } }

      it 'updates the requested vendor' do
        vendor = Vendor.create! valid_attributes
        put :update, params: { id: vendor.to_param, vendor: new_attributes }, session: valid_session
        vendor.reload
        expect(vendor.name).to eq(new_attributes[:name])
      end

      it 'returns http status 200:OK' do
        vendor = Vendor.create! valid_attributes
        put :update, params: { id: vendor.to_param, vendor: new_attributes }, session: valid_session
        expect(response).to have_http_status(:ok)
      end
    end

    context 'with invalid params' do
      it 'updates the requested vendor' do
        vendor = Vendor.create! valid_attributes
        vendor_name = vendor.name
        put :update, params: { id: vendor.to_param, vendor: { name: '' } }, session: valid_session
        vendor.reload
        expect(vendor.name).to eq(vendor_name)
      end

      it 'returns http status 422:Unprocessable Entity' do
        vendor = Vendor.create! valid_attributes
        put :update, params: { id: vendor.to_param, vendor: { name: '' } }, session: valid_session
        expect(response).to have_http_status(422)
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested vendor' do
      vendor = Vendor.create! valid_attributes
      expect do
        delete :destroy, params: { id: vendor.to_param }, session: valid_session
      end.to change(Vendor, :count).by(-1)
    end

    it 'returns http status 204:No Content' do
      vendor = Vendor.create! valid_attributes
      delete :destroy, params: { id: vendor.to_param }, session: valid_session
      expect(response).to have_http_status(204)
    end
  end
end
