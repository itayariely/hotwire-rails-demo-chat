class Message < ApplicationRecord
  acts_as_taggable_on :tags
  belongs_to :room
  broadcasts_to :room
  belongs_to :user, class_name: "User", foreign_key: :participant_id, optional: true
  after_create :touch_room
  after_create_commit {broadcast_replace_to "messages"}
  # after_create_commit {broadcast_prepend_to "messages"}
  # after_update_commit {broadcast_replace_to "messages"}
  # after_destroy_commit {broadcast_remove_to "messages"}

  def touch_room
    # system("notify-send -i face-wink 'YourDebugger!' 'message created'") if Rails.env != "production"
    room.touch
    # user.touch
    # system("notify-send -i face-wink 'YourDebugger!' 'ut'") if Rails.env != "production"
  end
end
