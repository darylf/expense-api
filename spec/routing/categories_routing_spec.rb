require 'rails_helper'

RSpec.describe API::V1::CategoriesController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/api/v1/categories').to route_to('api/v1/categories#index')
    end

    it 'routes to #show' do
      expect(get: '/api/v1/categories/1').to route_to('api/v1/categories#show', id: '1')
    end
  end
end
