class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :offer, null: false, foreign_key: true
      t.boolean :status
      t.float :total_price
      t.datetime :start_date
      t.datetime :end_date

      t.timestamps
    end
  end
end
