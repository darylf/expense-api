FactoryGirl.define do
  factory :category do
    sequence :name do |n|
      "#{Faker::Commerce.department} #{n}"
    end
  end
end
