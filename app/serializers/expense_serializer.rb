# Expense serializer
# Used for serializing the Expense object to JSON
class ExpenseSerializer < ActiveModel::Serializer
  attributes :id, :expense_date, :vendor_id, :cost, :category_id, :notes
end
