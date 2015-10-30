class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.integer :ticket_no
      t.integer :no_of_passengers
      t.integer :flight_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
