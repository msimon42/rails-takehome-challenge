class Company < ApplicationRecord
  has_many :offices
  has_many :employees

  validates_presence_of :name

  def total_rent
    offices.sum(&:rent)
  end
end
