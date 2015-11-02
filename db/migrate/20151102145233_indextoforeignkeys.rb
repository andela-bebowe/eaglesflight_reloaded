class Indextoforeignkeys < ActiveRecord::Migration
  def change
    add_index :bookings, :flight_id
    add_index :bookings, :user_id
    add_index :bookings, :plane_id
    add_index :flights, :destination_id
    add_index :flights, :departure_id
    add_index :passengers, :booking_id
    add_index :planes, :flight_id
    add_index :planes, :airline_id
  end
end
