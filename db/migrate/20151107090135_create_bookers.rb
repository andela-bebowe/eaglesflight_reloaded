class CreateBookers < ActiveRecord::Migration
  def change
    create_table :bookers do |t|
      t.string :booking_id
      t.string :express_token
      t.string :express_payer_id
      t.string :ip

      t.timestamps null: false
    end
    add_column :bookings, :booked_at, :datetime
  end
end
