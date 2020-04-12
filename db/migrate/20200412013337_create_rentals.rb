class CreateRentals < ActiveRecord::Migration[5.1]
  def change
    create_table :rentals do |t|
      t.references :client, foreign_key: true
      t.references :movie, foreign_key: true
      t.string :status

      t.timestamps
    end
  end
end
