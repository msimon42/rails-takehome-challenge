class Company < ApplicationRecord
  has_many :offices
  has_many :buildings, through: :offices
  has_many :employees, dependent: :destroy

  validates_presence_of :name

  def total_rent
    offices.sum(&:rent)
  end

  def building_names
    buildings.pluck(:name)
  end
end
