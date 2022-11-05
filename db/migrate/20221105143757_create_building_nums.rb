class CreateBuildingNums < ActiveRecord::Migration[6.0]
  def change
    create_table :building_nums do |t|

      t.timestamps
    end
  end
end
