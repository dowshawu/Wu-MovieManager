class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :movies

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]

  def self.from_omniauth(auth)
  	if self.where(email: auth.info.email).exists?
	    return_user = self.where(email: auth.info.email).first
	    return_user.provider = auth.provider
	    return_user.uid = auth.uid
	else
	    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        	user.uid = auth.uid
        	user.email = auth.info.email
        	user.password = Devise.friendly_token[0,20]
        	return_user = user
    	end
    end

	return_user  
  end
end
