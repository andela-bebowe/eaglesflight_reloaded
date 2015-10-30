class CreatePlanes < ActiveRecord::Migration
  def change
    create_table :planes do |t|
      t.string :name
      t.string :airline_id
      t.string :flight_id

      t.timestamps null: false
    end
  end
end
