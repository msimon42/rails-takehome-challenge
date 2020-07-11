FactoryBot.define do
  factory :building do
    name { "MyString" }
    country { "MyString" }
    address { "MyString" }
    rent_per_floor { 1.5 }
    number_of_floors { 1 }
  end
end
