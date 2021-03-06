class User < ActiveRecord::Base
    has_secure_password :validations => false
  has_many :time_sheets
	validates :name, :presence =>true,
	:format => {:with => ConfigCenter::GeneralValidations::NAME_FORMAT_REG_EXP},
	:unless => proc{|u| u.provider.present?}


	validates :email, :presence =>true,
	:uniqueness => true,
	:format => {:with => ConfigCenter::GeneralValidations::EMAIL_FORMAT_REG_EXP },:unless => proc{|u| u.provider.present?}


	validates :password, :presence =>true,
	:length => {:minimum => 6 },
	:unless => proc{|u| u.provider.present?}
  
 mount_uploader :image, ImageUploader
def self.authenticate(email, password)
	
    @user = find_by_email(email)
    
    if @user && @user.password_digest == BCrypt::Engine.hash_secret(password, user.password_digest)
    
    @user
    else
    nil
  end
end
 def self.from_omniauth(auth)
   create! do |user|
    user.provider = auth['provider']
    user.uid = auth['uid']
    user.oauth_token = auth['oauth_token']
    if auth['info']
      user.name = auth['info']['name'] || ""
      user.email = auth['info']['email'] || ""
    end
  end
end
       
end
