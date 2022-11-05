class CreateRoomNums < ActiveRecord::Migration[6.0]
  def change
    create_table :room_nums do |t|

      t.timestamps
    end
  end
end
