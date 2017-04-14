FactoryGirl.define do
  factory :expense do
    expense_date Faker::Date.backward(7)
    cost Faker::Number.decimal(2)
    notes Faker::Hipster.sentence
  end
end
