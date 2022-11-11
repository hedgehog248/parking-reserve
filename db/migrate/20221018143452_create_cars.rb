class CreateCars < ActiveRecord::Migration[6.0]
  def change
    create_table :cars do |t|
      t.string     :nickname,     null: false
      t.string     :model,        null: false
      t.string     :license_num,  null: false
      t.string     :drivers_name, null: false
      t.references :user,         null: false, foreign_keys: true
      t.timestamps
    end
  end
end
