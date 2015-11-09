class AddColumnNametobookers < ActiveRecord::Migration
  def change
    add_column :bookers, :first_name, :string
    add_column :bookers, :last_name, :string
    add_index :bookers, :booking_id
    add_column :bookings, :paid_booking, :boolean
  end
end
