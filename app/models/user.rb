class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :lockable,
         :omniauthable, :omniauth_providers => [:facebook]
      
  def self.find_for_facebook_oauth(auth)  
    user = where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name   # assuming the user model has a name
      user.lastname = auth.info.last_name  
      user.firstname = auth.info.first_name   
      user.gender = auth.extra.raw_info.gender   # assuming the user model has a name
      user.profile_image = auth.info.image
    end
  end
  
  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end
    
  has_many :posts, dependent: :destroy  
  has_many :replies, dependent: :destroy  
  has_many :likes
  has_many :posts, through: :likes
  has_many :replies, through: :likes

  mount_uploader :profile_image, ProfileUploader
  mount_uploader :cover_image, CoverUploader         
         
end
