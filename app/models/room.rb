class Room < ApplicationRecord
  has_many :messages, dependent: :destroy 
    accepts_nested_attributes_for :messages
  has_many :participants
  has_many :users, through: :participants
  after_touch :update_participants
  broadcasts
  # after_create_commit {broadcast_prepend_to "rooms"}
  # after_update_commit {broadcast_replace_to "rooms"}
  # after_destroy_commit {broadcast_remove_to "rooms"}

  def update_participants
    # system("notify-send -i face-wink 'YourDebugger!' 'room touched'") if Rails.env != "production"
    users.each {|p|p.touch }
  end
end
