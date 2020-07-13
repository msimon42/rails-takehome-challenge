RSpec.describe 'Create new company' do
  describe 'When I attempt to create a new company' do
    before :each do
      @building = create :building
      @office = create :office, building: @building

      visit new_company_path
    end

    it 'successfully creates new company' do
      fill_in :name, with: 'The Company'
      click_button 'Save'

      expect(current_path).to eq(company_path(Company.last.id))
      expect(page).to have_content('The Company')
    end

    it 'will not save if name is blank' do
      click_button 'Save'

      expect(current_path).to eq(new_company_path)
      expect(page).to have_content("Name can't be blank")
    end
  end
end
