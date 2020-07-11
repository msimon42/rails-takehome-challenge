FactoryBot.define do
  factory :employee do
    name { Faker::Name.name }
    title { Faker::Company.profession }
    association :company
  end
end
