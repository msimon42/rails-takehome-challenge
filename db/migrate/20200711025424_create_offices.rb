class CreateOffices < ActiveRecord::Migration[6.0]
  def change
    create_table :offices do |t|
      t.references :building, null: false, foreign_key: true
      t.string :floor

      t.timestamps
    end
  end
end
