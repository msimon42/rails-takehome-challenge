class Employee < ApplicationRecord
  belongs_to :company
  belongs_to :office

  validates_presence_of :name,
                        :title

  validates_length_of :name, minimum: 5

  before_save :check_for_valid_office_association

  private
    def check_for_valid_office_association
      unless company.office_ids.include?(office_id)
        raise 'Office must belong to employer. Employee not saved.'
      end  
    end
end
