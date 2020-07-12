class BuildingsFacade
  attr_reader :building

  def initialize(building)
    @building = building
  end


  def companies_by_floor
    row_info = Struct.new(:floor_number, :company_label, :path)
    @building.offices.map do |office|
      if office.company
        row_info.new(office.floor, office.company.name, "/companies/#{office.company.id}")
      else
        row_info.new(office.floor, '', '#')
      end
    end
  end
end
