class AddColumnsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :email, :string
    add_column :users, :origin_id, :integer
  end
end
