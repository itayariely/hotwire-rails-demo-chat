class AddAlmondFieldsToRooms < ActiveRecord::Migration[6.1]
  def change
    add_column :rooms, :room_type, :integer
    add_column :rooms, :status, :integer
    add_column :rooms, :company_hash, :string
  end
end
