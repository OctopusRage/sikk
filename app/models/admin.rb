class Admin < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  before_create :set_auth_token
  
  def set_auth_token
    self.authentication_token = loop do
      token = SecureRandom.urlsafe_base64
      break token unless self.class.exists?(authentication_token: token)
    end
  end
end
