require 'rails_helper'

RSpec.describe Office, type: :model do
  describe 'relationships' do
    it { should belong_to(:company).optional }
    it { should belong_to :building }
    it { should have_many :employees}
  end

  describe 'validations' do
    before :each do
      building = create :building, rent_per_floor: 1000
      company = create :company
      @office_1 = create :office, building: building, company: company
      @office_2 = create :office
    end

    it 'self.available' do
      office = Office.available
      expect(office.length).to eq(1)
      expect(office.first).to eq(@office_2)
    end

    it 'self.unavailable' do
      office = Office.unavailable
      expect(office.length).to eq(1)
      expect(office.first).to eq(@office_1)
    end

    it 'rent' do
      expect(@office_1.rent).to eq(1000)
    end
  end
end
