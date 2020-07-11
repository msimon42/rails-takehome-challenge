FactoryBot.define do
  factory :office do
    association :building
    floor { "#{rand(25)}" }
  end
end
