class Game < ActiveRecord::Base
  	
  	has_many :users
  	belongs_to :user	
 	belongs_to :friend, class_name: 'User', foreign_key: 'friend_id'

enum states: ["pending", "approved"]
# def to_param
# 	gamertag
# end



end