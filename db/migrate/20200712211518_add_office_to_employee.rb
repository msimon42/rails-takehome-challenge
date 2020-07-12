class AddOfficeToEmployee < ActiveRecord::Migration[6.0]
  def change
    add_reference :employees, :office, index: true
  end
end
