class AddLastVisitToParticipants < ActiveRecord::Migration[6.1]
  def change
    add_column :participants, :last_visit, :datetime
  end
end
