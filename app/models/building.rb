class Building < ApplicationRecord
  has_many :offices
  has_many :companies, through: :offices

  validates_presence_of :name,
                        :country,
                        :address,
                        :rent_per_floor,
                        :number_of_floors

  validates_numericality_of :rent_per_floor,
                            :number_of_floors

  def available_floors
    available_offices.pluck(:floor)
  end

  def occupied_floors
    unavailable_offices.pluck(:floor)
  end

  def available_offices
    offices.available
  end

  def occupied_offices
    offices.unavailable
  end

  def current_monthly_receipts
    occupied_offices.length * rent_per_floor
  end

  def employees
    companies.joins(:employees)
  end

  def total_employees_with_access
    employees.length
  end
end
