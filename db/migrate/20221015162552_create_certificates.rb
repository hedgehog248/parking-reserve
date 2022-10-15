class CreateCertificates < ActiveRecord::Migration[6.0]
  def change
    create_table :certificates do |t|
      t.string     :building_num,  null: false
      t.string     :room_num,      null: false
      t.string     :destination,   null: false
      t.string     :car_model,     null: false
      t.string     :license_num,   null: false
      t.string     :derivers_name, null: false
      t.references :reservations,  null: false, foreign_keys: true
      t.timestamps
    end
  end
end
