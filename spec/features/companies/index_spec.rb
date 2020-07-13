require 'rails_helper'

RSpec.describe 'Companies index page' do
  describe 'When I visit the companies index' do
    before :each do
      @companies = create_list :company, 10
      visit companies_path
    end

    it 'lists all buildings' do
      @companies.each do |company|
        expect(page).to have_link(company.name)
      end
    end
  end
end
