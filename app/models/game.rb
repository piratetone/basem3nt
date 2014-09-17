class Game < ActiveRecord::Base
  	
  	belongs_to :user	
 	belongs_to :friend, class_name: 'User', foreign_key: 'friend_id'

 end

# def to_param
# 	gamertag
# end