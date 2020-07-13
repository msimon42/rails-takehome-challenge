require 'rails_helper'

RSpec.describe 'Buildings index page' do
  describe 'When I visit the buildings index' do
    before :each do
      @buildings = create_list :building, 10
      visit buildings_path
    end

    it 'lists all buildings' do
      @buildings.each do |building|
        expect(page).to have_link(building.name)
      end
    end
  end
end
