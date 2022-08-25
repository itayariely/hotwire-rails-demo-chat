class AddNoteToNotes < ActiveRecord::Migration[6.1]
  def change
    add_column :notes, :note, :text
  end
end
