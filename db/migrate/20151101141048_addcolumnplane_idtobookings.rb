class AddcolumnplaneIdtobookings < ActiveRecord::Migration
  def change
    add_column :bookings, :plane_id, :integer
  end
end
