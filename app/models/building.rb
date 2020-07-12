class Building < ApplicationRecord
  has_many :offices
  has_many :companies, through: :offices
  has_many :employees, through: :companies

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
    occupied_offices.pluck(:floor)
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

  def total_employees_with_access
    employees.length
  end

  def companies_by_floor
    query = ActiveRecord::Base.connection.execute(
      """
      SELECT offices.floor, companies.name, companies.id
      FROM offices
      LEFT JOIN companies ON offices.company_id = companies.id
      WHERE offices.building_id = #{self.id}
      ORDER BY companies.name
      """
    )
    query.to_a
  end
end
