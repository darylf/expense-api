require 'rails_helper'

RSpec.describe Vendor, type: :model do
  let(:vendor) { FactoryGirl.build(:vendor) }

  before(:each) { expect(vendor).to be_valid }

  describe '#name' do
    it 'is invalid when empty' do
      vendor.name = ''
      expect(vendor).to_not be_valid
    end

    it 'must be unique' do
      vendor.save
      dupe_vendor = FactoryGirl.build(:vendor, name: vendor.name)
      expect(dupe_vendor).to_not be_valid
    end
  end
end
