class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,   
         :recoverable, :rememberable, :trackable, :validatable  
  devise :omniauthable, :omniauth_providers => [:twitter]

  has_many :flights

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name 
      user.image = auth.info.image
      user.token = auth.credentials.token 
    end
  end
end
