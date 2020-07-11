require 'rails_helper'

RSpec.describe Building, type: :model do
  describe 'relationships' do
    it { should have_many :offices }
    it { should have_many(:companies).through(:offices)}
  end

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :country }
    it { should validate_presence_of :address }
    it { should validate_presence_of :rent_per_floor }
    it { should validate_presence_of :number_of_floors }
    it { should validate_numericality_of :rent_per_floor}
    it { should validate_numericality_of :number_of_floors}
  end

  describe 'methods' do
    before :each do
      @building = create :building, number_of_floors: 10, rent_per_floor: 1000
      @offices = create_list :office, 10, building: @building
      @company_1 = create :company
      @company_2 = create :company

      @company_1.offices << @offices[3]
      @company_2.offices << @offices[7]

      create_list :employee, 5, company: @company_1
      create_list :employee, 4, company: @company_2
    end

    it 'available_floors' do
      expect(@building.available_floors.length).to eq(8)
    end

    it 'occupied_floors' do
      expect(@building.occupied_floors.length).to eq(2)
    end

    it 'available_offices' do
      expect(@building.available_offices.length).to eq(8)
      expect(@building.available_offices[0].class).to eq(Office)
    end

    it 'occupied_offices' do
      expect(@building.occupied_offices.length).to eq(2)
      expect(@building.occupied_offices[0].class).to eq(Office)
    end

    it 'current_monthly_receipts' do
      expect(@building.current_monthly_receipts).to eq(2000)
    end

    it 'employees' do
      expect(@building.employees[0].class).to eq(Employee)
    end

    it 'total_employees_with_access' do
      expect(@building.total_employees_with_access).to eq(9)
    end
  end
end
