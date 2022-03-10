class Participant < ApplicationRecord
  belongs_to :user, foreign_key: :participant_id
  # broadcasts_to :room_id
  # after_touch :update_last_visit

  def update_user
    # system("notify-send -i face-wink 'YourDebugger!' 'participant touched'") if Rails.env != "production"
    # update last_visit: DateTime.now
    user.touch
  end

  def update_last_visit
    update last_visit: DateTime.now
    user.touch
  end

  def unread_messages
    Message.where.not(participant_id:participant_id).where("created_at > ?",last_visit)
  end

  def unread_messages_count
    unread_messages.size
  end
end
