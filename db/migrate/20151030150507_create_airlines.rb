class CreateAirlines < ActiveRecord::Migration
  def change
    create_table :airlines do |t|
      t.string :name
      t.decimal :price

      t.timestamps null: false
    end
  end
end
