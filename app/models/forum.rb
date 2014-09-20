class Forum < ActiveRecord::Base
	has_many :topics, :dependent => :destroy
	belongs_to :user, :dependent => :destroy
	has_many :posts, :dependent => :destroy
end
