class AddColumnCosttobooking < ActiveRecord::Migration
  def change
    add_column :bookings, :cost, :string
  end
end
