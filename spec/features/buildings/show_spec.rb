RSpec.describe 'Building Show Page' do
  describe 'When I visit a building show page' do
    before :each do
      @building = create :building
      visit building_path(@building.id)
    end

    it 'displays information on the building' do
      expect(page).to have_content(@building.name)
      expect(page).to have_content(@building.country)
      expect(page).to have_content(@building.address)
      expect(page).to have_content(@building.number_of_floors)
      expect(page).to have_content(@building.total_employees_with_access)
    end
  end
end
