class CreateCertificates < ActiveRecord::Migration[6.0]
  def change
    create_table :certificates do |t|
      t.integer    :building_num_id,  null: false
      t.integer    :room_num_id,      null: false
      t.string     :destination,      null: false
      t.string     :car_model,        null: false
      t.string     :license_num,      null: false
      t.string     :drivers_name,     null: false
      t.references :reservation,      null: false, foreign_keys: true
      t.timestamps
    end
  end
end
