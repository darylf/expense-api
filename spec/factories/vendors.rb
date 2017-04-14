FactoryGirl.define do
  factory :vendor do
    sequence :name do |n|
      "#{Faker::Company.name} #{n}"
    end
  end
end
