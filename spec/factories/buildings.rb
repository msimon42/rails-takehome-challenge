FactoryBot.define do
  factory :building do
    name { "The #{Faker::Name.last_name} Building" }
    country { "USA" }
    address { Faker::Address.full_address }
    rent_per_floor { rand(5000..10000) }
    number_of_floors { rand(2..25) }
  end
end
