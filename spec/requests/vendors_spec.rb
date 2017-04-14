require 'rails_helper'

RSpec.describe 'Vendors API' do
  it 'sends a list of vendors' do
    FactoryGirl.create_list(:vendor, 10)

    get '/api/v1/vendors'

    json = JSON.parse(response.body)

    # test for the 200 status-code
    expect(response).to be_success

    # check to make sure the right amount of vendors are returned
    expect(json.length).to eq(10)
  end
end
