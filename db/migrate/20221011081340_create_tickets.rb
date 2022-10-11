class CreateTickets < ActiveRecord::Migration[6.0]
  def change
    create_table :tickets do |t|
      t.string     :destination
      t.string     :car_model
      t.references :reservations, null: false, foreign_keys: true
      t.timestamps
    end
  end
end
