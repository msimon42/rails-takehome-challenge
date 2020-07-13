require 'rails_helper'

RSpec.describe Company, type: :model do
  describe 'relationships' do
    it { should have_many :offices }
    it { should have_many :employees }
    it { should have_many(:buildings).through(:offices)}
  end

  describe 'validations' do
    it { should validate_presence_of :name }
  end

  describe 'methods' do
    before :each do
      @company = create :company
      @company.offices << create_list(:office, 2)
    end

    it 'total_rent' do
      expect(@company.total_rent).to eq(@company.offices[0].rent + @company.offices[1].rent)
    end
  end
end
