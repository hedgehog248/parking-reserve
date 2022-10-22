class AddDriversNameToCars < ActiveRecord::Migration[6.0]
  def change
    add_column :cars, :drivers_name, :string, null: false
  end
end
