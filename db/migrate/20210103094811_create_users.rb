class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :participant_hash
      t.string :company_hash
      t.string :company_id
      t.string :avatar
      t.integer :status

      t.timestamps
    end
  end
end
