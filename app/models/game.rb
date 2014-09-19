class Game < ActiveRecord::Base
  	
  	has_many :users
  	belongs_to :user	
 	belongs_to :friend, class_name: 'User', foreign_key: 'friend_id'

enum states: ["pending", "approved"]
# def to_param
# 	gamertag
# end
def self.request(user1, user2)
		# transaction do
		# 	friendship1 = create(user: user1, friend: user2, state: "pending")
		# 	friendship2 = create(user: user2, friend: user1, state: "requested")
			
			# friendship1.send_request_email if !friendship1.new_record?
			# friendship1
		# end
	end


end