class User < ActiveRecord::Base
    has_secure_password

	validates :name, :presence =>true,
	:format => {:with => ConfigCenter::GeneralValidations::NAME_FORMAT_REG_EXP}

	validates :email, :presence =>true,
	:uniqueness => true,
	:format => {:with => ConfigCenter::GeneralValidations::EMAIL_FORMAT_REG_EXP }

	validates :password, :presence =>true,
	:length => {:minimum => 6 }
	
end
