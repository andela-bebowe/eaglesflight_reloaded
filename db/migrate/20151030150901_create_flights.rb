class CreateFlights < ActiveRecord::Migration
  def change
    create_table :flights do |t|
      t.integer :destination_id
      t.integer :departure_id
      t.datetime :departure_date
      t.integer :airline_id
      t.decimal :price

      t.timestamps null: false
    end
  end
end
