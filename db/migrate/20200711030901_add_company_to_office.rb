class AddCompanyToOffice < ActiveRecord::Migration[6.0]
  def change
    add_reference :offices, :company, index: true
  end
end
