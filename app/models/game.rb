class Game < ActiveRecord::Base
  	
  	has_many :users
  	belongs_to :user	
 	belongs_to :friend, class_name: 'User', foreign_key: 'friend_id'


# def to_param
# 	gamertag
# end



end