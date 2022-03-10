class AddAlmondColumnsToMessages < ActiveRecord::Migration[6.1]
  def change
    add_column :messages, :participant_hash, :string
    add_column :messages, :participant_id, :integer
    add_column :messages, :company_hash, :string
    add_column :messages, :company_id, :integer
  end
end
