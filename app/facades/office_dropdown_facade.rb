class OfficeDropdownFacade
  def self.prepare_for_dropdown(offices)
    dropdown_option = Struct.new(:id, :info)

    offices.map do |office|
      dropdown_option.new(office.id, "#{office.building.name}, Floor: #{office.floor}")
    end
  end
end
