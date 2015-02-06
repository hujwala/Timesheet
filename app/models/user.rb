  class User < ActiveRecord::Base
  	# attr_accessor :password
  
   has_secure_password

 validates :name,presence: true, 
 :format => { with: /[A-Z]/}
 
  validates :email,
      presence: true,
      uniqueness: {message: "Email already exists"},
      :format => {:with =>  ConfigCenter::GeneralValidations::EMAIL_FORMAT_REG_EXP, message: "Invalid email"}
 validates :password,
 :presence => true, 
 :length => {:minimum => 6}
end 

