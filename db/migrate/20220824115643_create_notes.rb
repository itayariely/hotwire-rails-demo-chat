class CreateNotes < ActiveRecord::Migration[6.1]
  def change
    create_table :notes do |t|
      t.string :text
      t.integer :user_id
      t.integer :status

      t.timestamps
    end
  end
end
