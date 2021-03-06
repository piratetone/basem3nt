class User < ActiveRecord::Base

  has_many :games
  has_many :reverse_games, foreign_key: "friends_id", 
              class_name: "games"
  has_many :forums
  has_many :posts
  has_many :topics
  has_many :friends


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  geocoded_by :location    # can also be an ip address
  after_validation :geocode   # auto-fetch coordinates 



  has_attached_file :avatar, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  devise :omniauthable

  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    if user
      return user
    else
      registered_user = User.where(:email => auth.info.email).first
      if registered_user
        return registered_user
      else
        user = User.create(name:auth.extra.raw_info.name,
                            provider:auth.provider,
                            uid:auth.uid,
                            email:auth.info.email,
                            password:Devise.friendly_token[0,20],
                          )
     		end
      end    
  end

end
