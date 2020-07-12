class Employee < ApplicationRecord
  belongs_to :company
  belongs_to :office
  
  validates_presence_of :name,
                        :title

  validates_length_of :name, minimum: 5
end
