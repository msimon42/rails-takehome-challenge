# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Employee.destroy_all
Office.destroy_all
Company.destroy_all
Building.destroy_all


buildings = FactoryBot.create_list(:building, 10)

buildings.each do |building|
  (1..building.number_of_floors).each do |n|
    FactoryBot.create(:office, building: building, floor: n)
  end
end

offices = Office.all
companies = FactoryBot.create_list(:company, (offices.length - 15))

companies.each do |company|
  office = Office.available.order('RAND()').first
  company.offices << office

  FactoryBot.create_list(:employee, rand(10..50), company: company, office: office)
end
