class Office < ApplicationRecord
  belongs_to :building
  belongs_to :company, optional: true
  has_many :employees

  validates :floor, presence: true, numericality: true

  before_create :valid_building_placement?

  def self.available
    where(company_id: nil)
  end

  def self.unavailable
    where.not(company_id: nil)
  end

  def rent
    building.rent_per_floor
  end

  def building_name
    building.name
  end

  private

    def valid_building_placement?
      enough_space = building.offices.size < building.number_of_floors
      not_duplicate_floor_number = building.all_floors.exclude?(floor)

      unless enough_space && not_duplicate_floor_number
        raise 'Office cannot be created. There may not be enough room in the building, or this floor may already exist.'
      end
    end
end
