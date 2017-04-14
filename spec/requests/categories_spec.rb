require 'rails_helper'

RSpec.describe 'Categories API' do
  it 'sends a list of categoriess' do
    FactoryGirl.create_list(:category, 10)

    get '/api/v1/categories'

    json = JSON.parse(response.body)

    # test for the 200 status-code
    expect(response).to be_success

    # check to make sure the right amount of categories are returned
    expect(json.length).to eq(10)
  end
end
