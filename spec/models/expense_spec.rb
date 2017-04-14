require 'rails_helper'

RSpec.describe Expense, type: :model do
  let(:category) { FactoryGirl.create(:category) }
  let(:vendor) { FactoryGirl.create(:vendor) }
  let(:expense) { FactoryGirl.build(:expense, category_id: category.id, vendor_id: vendor.id) }

  before(:each) { expect(expense).to be_valid }

  describe '#expense_date' do
    it 'is invalid when empty' do
      expense.expense_date = ''
      expect(expense).to_not be_valid
    end
  end

  describe '#cost' do
    it 'is invalid when empty' do
      expense.cost = ''
      expect(expense).to_not be_valid
    end
  end

  describe '#vendor_id' do
    it 'is invalid when empty' do
      expense.vendor_id = ''
      expect(expense).to_not be_valid
    end
  end

  describe '#category_id' do
    it 'is invalid when empty' do
      expense.category_id = ''
      expect(expense).to_not be_valid
    end
  end
end
