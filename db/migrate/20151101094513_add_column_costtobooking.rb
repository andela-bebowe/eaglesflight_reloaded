class AddColumnCosttobooking < ActiveRecord::Migration
  def change
    add_column :bookings, :cost, :string
    add_column :bookings, :plane_id, :integer
  end
end
