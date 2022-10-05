class CreateReservations < ActiveRecord::Migration[6.0]
  def change
    create_table :reservations do |t|
      t.integer :park_num,        null: false
      t.datetime :start_datetime, null: false
      t.datetime :end_datetime,   null: false
      t.references :user,         null: false, foreign_keys: true
      t.datetime :start_date
      t.timestamps
    end
  end
end
