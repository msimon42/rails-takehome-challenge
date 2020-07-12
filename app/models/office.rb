class Office < ApplicationRecord
  belongs_to :building
  belongs_to :company, optional: true
  has_many :employees

  validates :floor, presence: true, numericality: true

  def self.available
    where(company_id: nil)
  end

  def self.unavailable
    where.not(company_id: nil)
  end

  def rent
    building.rent_per_floor
  end
end
