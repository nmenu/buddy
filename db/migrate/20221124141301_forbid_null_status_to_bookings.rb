class ForbidNullStatusToBookings < ActiveRecord::Migration[7.0]
  def change
    change_column :bookings, :status, :integer, default: 0, null: false
  end
end
