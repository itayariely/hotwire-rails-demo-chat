class User < ApplicationRecord
   acts_as_tagger
  has_many :messages, foreign_key: :participant_id
  has_many :participations, class_name:"Participant", foreign_key: :participant_id
  # belongs_to :user, class_name: "User", foreign_key: :participant_id, optional: true
  broadcasts
  after_touch :user_touched_indication
    # after_destroy_commit {broadcast_remove_to "users"}

    def unread_messages
      (participations.map &:unread_messages_count)
    end

    def unread_messages_count
      (participations.map &:unread_messages_count).sum
    end

    def user_touched_indication
      # system("notify-send -i face-wink 'YourDebugger!' 'user touched'") if Rails.env != "production"
    end
end
