RSpec.describe 'Create new Employee' do
  describe 'When I attempt to create a new employee' do
    before :each do
      @company = create :company
      @office = create :office
      @company.offices << @office

      visit new_company_employee_path(@company.id)
    end

    it 'successfully create new employee' do
      fill_in :name, with: 'John Smith'
      fill_in :title, with: 'Job'
      click_button 'Save'

      expect(current_path).to eq(company_path(@company.id))
      expect(page).to have_content('John Smith')
    end

    it 'Will not save if field is blank' do
      fill_in :name, with: 'John Smith'
      click_button 'Save'

      expect(current_path).to eq(new_company_employee_path(@company.id))
      expect(page).to have_content("Title can't be blank")
    end

    it 'Will not save if name field is fewer than 5 chars' do
      fill_in :name, with: 'John'
      fill_in :title, with: 'Job'
      click_button 'Save'

      expect(current_path).to eq(new_company_employee_path(@company.id))
      expect(page).to have_content("Name is too short (minimum is 5 characters)")
    end
  end
end
