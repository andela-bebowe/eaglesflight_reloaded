class CreateFlights < ActiveRecord::Migration
  def change
    create_table :flights do |t|
      t.string :destination_id
      t.string :departure_id
      t.datetime :departure_date
      t.decimal :price

      t.timestamps null: false
    end
  end
end
