class Invite < ActiveRecord::Base
  belongs_to :attendee, class_name: "User"
  belongs_to :attended_event, class_name: "Game"

  validates :attendee_id, presence: true
  validates :attended_event_id, presence: true
end
