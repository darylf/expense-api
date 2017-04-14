# Expense record
class Expense < ApplicationRecord
  validates :expense_date, presence: true

  validates :cost, presence: true, numericality: true, format: { with: /\A\d{1,4}(\.\d{0,2})?\z/ }

  validates :category_id, presence: true

  validates :vendor_id, presence: true
end
