require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:category) { FactoryGirl.build(:category) }

  before(:each) { expect(category).to be_valid }

  describe '#name' do
    it 'is invalid when empty' do
      category.name = ''
      expect(category).to_not be_valid
    end
  end
end
