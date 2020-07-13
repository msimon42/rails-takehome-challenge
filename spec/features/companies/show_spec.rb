RSpec.describe 'company Show Page' do
  describe 'When I visit a company show page' do
    before :each do
      @company = create :company
      visit company_path(@company.id)
    end

    it 'displays information on the company' do
      expect(page).to have_content(@company.name)
      expect(page).to have_content(@company.total_offices)
    end
  end
end
