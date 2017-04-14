# Create the initial expenses table
class CreateExpenses < ActiveRecord::Migration[5.0]
  def change
    create_table :expenses do |t|
      t.date :expense_date, index: true, null: false
      t.references :vendor, index: true, foreign_key: true, null: false
      t.decimal :cost, precision: 8, scale: 2, null: false
      t.references :category, index: true, foreign_key: true, null: false
      t.text :notes

      t.timestamps
    end
  end
end
