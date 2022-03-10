class CreateParticipants < ActiveRecord::Migration[6.1]
  def change
    create_table :participants do |t|
      t.integer :room_id
      t.integer :participant_id
      t.string :participant_hash
      t.string :company_hash
      t.string :company_id

      t.timestamps
    end
  end
end
