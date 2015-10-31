class CreatePlanes < ActiveRecord::Migration
  def change
    create_table :planes do |t|
      t.string :name
      t.integer :flight_id
      t.integer :airline_id

      t.timestamps null: false
    end
  end
end
