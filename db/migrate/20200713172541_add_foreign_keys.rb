class AddForeignKeys < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :employees, :offices
    add_foreign_key :offices, :companies
  end
end
